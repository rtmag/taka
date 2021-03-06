#cat *broadPeak|sort -k1,1 -k2,2n |bedtools merge -i - > atac_merged_broadPeaks.bed

library(Rsubread)

x=read.table('/root/taka/ATAC-seq/macs2/atac_merged_broadPeaks.bed',sep="\t",stringsAsFactors=F)
ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c(
"/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_3.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_4.bam",
"/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_3.bam",
"/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_4.bam",
"/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_2.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_1.bam",
"/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_2.bam")

sink("/root/taka/ATAC-seq/deseq2/ATAC-Seq_featureCounts.log")
fc_SE <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=FALSE,nthreads=50)
sink()

countData=fc_SE$counts

colnames(countData)=c(
"HSC_AGED_1","HSC_AGED_2","HSC_AGED_3","HSC_AGED_4",
"CLP_AGED_1","CLP_AGED_2",
"GMP_AGED_1","GMP_AGED_2",
"MEP_AGED_1","MEP_AGED_2",
"MPP1_AGED_1","MPP1_AGED_2",
"MPP2_AGED_1","MPP2_AGED_2",
"MPP3_AGED_1","MPP3_AGED_2",
"MPP4_AGED_1","MPP4_AGED_2",
"HSC_YOUNG_1","HSC_YOUNG_2","HSC_YOUNG_3","HSC_YOUNG_4",
"CLP_YOUNG_1","CLP_YOUNG_2",
"GMP_YOUNG_1","GMP_YOUNG_2",
"MEP_YOUNG_1","MEP_YOUNG_2",
"MPP1_YOUNG_1","MPP1_YOUNG_2",
"MPP2_YOUNG_1","MPP2_YOUNG_2",
"MPP3_YOUNG_1","MPP3_YOUNG_2",
"MPP4_YOUNG_1","MPP4_YOUNG_2")
saveRDS(countData,'atac_countdata.rds')
##
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)
countData=readRDS('atac_countdata.rds')

design<-data.frame(cell=c(
"HSC","HSC","HSC","HSC",
"CLP","CLP",
"GMP","GMP",
"MEP","MEP",
"MPP1","MPP1",
"MPP2","MPP2",
"MPP3","MPP3",
"MPP4","MPP4",
"HSC","HSC","HSC","HSC",
"CLP","CLP",
"GMP","GMP",
"MEP","MEP",
"MPP1","MPP1",
"MPP2","MPP2",
"MPP3","MPP3",
"MPP4","MPP4"
                          ),
age=c(
"OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD",
"YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG",
"YOUNG","YOUNG","YOUNG","YOUNG"
)
)


dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ cell + age )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)
saveRDS(vsd,"HSC_vsd.rds")
saveRDS(dLRT_res,"dLRT_res_anova.rds")
dLRT_res = readRDS("dLRT_res_anova.rds")

pca=plotPCA(dLRT_vsd,ntop=20000,intgroup=c("cell","age"),returnData=T)

track=as.character(pca$cell)
track[track=="HSC"]=1
track[track=="MPP1"]=2
track[track=="MPP2"]=3
track[track=="MPP3"]=4
track[track=="MPP4"]=5
track[track=="CLP"]=6
track[track=="GMP"]=7
track[track=="MEP"]=8
track=as.numeric(track)
colores=c("#508cd7","#64b964","#e6c86e","#FF9900","#9966cc",
          "#EE1C2E","#6EC5E9","#8e593c")
clab=as.character(colores[track])

track2=as.character(pca$age)
track2[track2=="OLD"]=1
track2[track2=="YOUNG"]=2
track2=as.numeric(track2)
colores2=c("17","16")
clab2=as.character(colores2[track2])

pdf("Diagnostic_pca_all_samples.pdf")
plot(pca$PC1,pca$PC2,col=clab,cex=2,xlab="PCA1: 50% variance",ylab="PCA2: 23% variance",pch=as.numeric(clab2))
legend("topright",legend=c("HSC","MPP1","MPP2","MPP3","MPP4","CLP","GMP","MEP","----","OLD","YOUNG"),
       col=c("#508cd7","#64b964","#e6c86e","#FF9900","#9966cc","#EE1C2E","#6EC5E9","#8e593c",NA,"grey","grey"), 
       border=T,pch=c(15,15,15,15,15,15,15,15,NA,17,16),cex=1.5 )
dev.off()


track=as.character(design$cell)
track[track=="HSC"]=1
track[track=="MPP1"]=2
track[track=="MPP2"]=3
track[track=="MPP3"]=4
track[track=="MPP4"]=5
track[track=="CLP"]=6
track[track=="GMP"]=7
track[track=="MEP"]=8

track=as.numeric(track)
colores=c("#508cd7","#64b964","#e6c86e","#FF9900","#9966cc",
          "#EE1C2E","#6EC5E9","#8e593c")
clab=as.character(colores[track])

track2=as.character(design$age)
track2[track2=="OLD"]=1
track2[track2=="YOUNG"]=2
track2=as.numeric(track2)
colores2=c("black","grey")
clab2=as.character(colores2[track2])


colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

source("https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R")

pdf("legends.pdf")
plot(NULL)
legend("center",legend=c("HSC","MPP1","MPP2","MPP3","MPP4","CLP","GMP","MEP","OLD","YOUNG"),
       fill=c("#508cd7","#64b964","#e6c86e","#FF9900","#9966cc","#EE1C2E","#6EC5E9","#8e593c","black","grey"), 
       border=T, bty="n",cex=1.5 )
dev.off()

sig_vsd = vsd[which(dLRT_res$padj<10e-70),]
png("anova_heatmap_FDR10e-50.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),key.title="Gene expression",cexCol=.6,
          ColSideColors=cbind(Cell=clab,Age=clab2))
dev.off()

sig_vsd = vsd[which(dLRT_res$padj<10e-60),]
png("anova_heatmap_FDR10e-60.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),key.title="Gene expression",cexCol=.6,
          ColSideColors=cbind(Cell=clab,Age=clab2))
dev.off()

sig_vsd = vsd[which(dLRT_res$padj<10e-70),]
png("anova_heatmap_FDR10e-70.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),key.title="Gene expression",cexCol=.6,
          ColSideColors=cbind(Cell=clab,Age=clab2))
dev.off()

hc <- as.hclust( x$rowDendrogram )
groups=cutree( hc, k=5 )
track3=as.numeric(groups)
colores3=c("#4c516d","#e1cbcb","#db8d8d","#c7c1c7","#897689")
clab3=(colores3[track3])
####################################################################################################################################

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ cell + age )
dLRT <- DESeq(dLRT, test="LRT", full= ~ cell + age, reduced=~ cell)
dds_res <- results(dLRT,contrast=c("age","YOUNG","OLD"))

track=as.character(design$cell)
track[track=="HSC"]=1
track[track=="MPP1"]=2
track[track=="MPP2"]=3
track[track=="MPP3"]=4
track[track=="MPP4"]=5
track[track=="CLP"]=6
track[track=="GMP"]=7
track[track=="MEP"]=8

track=as.numeric(track)
colores=c("#508cd7","#64b964","#e6c86e","#FF9900","#9966cc",
          "#EE1C2E","#6EC5E9","#8e593c")
clab=as.character(colores[track])

track2=as.character(design$age)
track2[track2=="OLD"]=1
track2[track2=="YOUNG"]=2
track2=as.numeric(track2)
colores2=c("black","grey")
clab2=as.character(colores2[track2])

vsd<-readRDS("HSC_vsd.rds")

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), ]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
png("Young_VS_Old_heatmap_FDR5e-2_Log2FC1.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x=heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),cexCol=.6,ColSideColors=cbind(Cell=clab,Age=clab2))
dev.off()
###########################################################################################
# most variation occurs at HSC
# All combinations of Young VS OLD
#######
############### HSC ######################
cellType="HSC"
deseq_Young_VS_OLD = function(cellType){
dLRT <- DESeqDataSetFromMatrix(countData = countData[,which(design$cell==cellType)], 
                               colData = data.frame(age=design[which(design$cell==cellType),2]), 
                               design = ~ age )
dLRT <- DESeq(dLRT)
dds_res <- results(dLRT,contrast=c("age","YOUNG","OLD"))
# Volcano
  title= paste(cellType,"_YOUNG_VS_OLD_volcano.pdf",sep="")
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ')),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20 )
  abline(v=-1,lty = 2,col="grey")
  abline(v=1,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dds_res$log2FoldChange[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
       -log10(dds_res$padj)[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
      col="red",pch=20)
  legend("topright", paste("Young",":",length(which(dds_res$log2FoldChange>1 & dds_res$padj<0.05))), bty="n") 
  legend("topleft", paste("Old",":",length(which(dds_res$log2FoldChange<(-1) & dds_res$padj<0.05))), bty="n") 
  dev.off()
# Heatmap
  title= paste(cellType,"_YOUNG_VS_OLD_heatmap.png",sep="")
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), which(design$cell==cellType)]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
x=heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),cexCol=.6,
            ColSideColors=cbind(Cell=clab[which(design$cell==cellType)],Age=clab2[which(design$cell==cellType)]))
  dev.off()
  # Heatmap ALL
  title= paste(cellType,"_YOUNG_VS_OLD_heatmap_allSample.png",sep="")
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
x=heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"ATAC-Seq Peaks"),cexCol=.6,
            ColSideColors=cbind(Cell=clab,Age=clab2))
  dev.off()
# MAplot
  title= paste(cellType,"_YOUNG_VS_OLD_MAplot.pdf",sep="")
  pdf(title)
  plotMA(dds_res)
  dev.off()
# Significant Results ordered by log2FC
library(stringr)
  csv_table = dds_res
  csv_table = data.frame( str_split_fixed(rownames(csv_table), "_!_", 3), csv_table )
  colnames(csv_table)[1] = "chr"
  colnames(csv_table)[2] = "start"
  colnames(csv_table)[3] = "end"
  title= paste(cellType,"_HIGH_YOUNG_table.csv",sep="")
  write.csv(csv_table[which(dds_res$log2FoldChange>1 & dds_res$padj<0.05),],title,row.names=F)
  title= paste(cellType,"_HIGH_OLD_table.csv",sep="")
  write.csv(csv_table[which(dds_res$log2FoldChange<(-1) & dds_res$padj<0.05),],title,row.names=F)
  }
############### HSC ######################
deseq_Young_VS_OLD(cellType="HSC")
deseq_Young_VS_OLD(cellType="MPP1")
deseq_Young_VS_OLD(cellType="MPP2")
deseq_Young_VS_OLD(cellType="MPP3")
deseq_Young_VS_OLD(cellType="MPP4")
deseq_Young_VS_OLD(cellType="CLP")
deseq_Young_VS_OLD(cellType="GMP")
deseq_Young_VS_OLD(cellType="MEP")

