library(Rsubread)
options(scipen=999)

sink("/root/taka/RNA-seq/deseq2/RNA-Seq_featureCounts.log")

data<-featureCounts(c(
"/root/taka/RNA-seq/bam/OH_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/OH_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om1_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om1_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om2_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om2_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om3_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om3_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om4_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Om4_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/YH_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/YH_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym1_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym1_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym2_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym2_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym3_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym3_2.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym4_1.fastq.gz_Aligned.sortedByCoord.out.bam",
"/root/taka/RNA-seq/bam/Ym4_2.fastq.gz_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.vM19.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)
sink()

dat=data[[1]]
colnames(dat)=c("OH1","OH2","OM1_1","OM1_2","OM2_1","OM2_2","OM3_1","OM3_2","OM4_1","OM4_2",
"YH1","YH2","YM1_1","YM1_2","YM2_1","YM2_2","YM3_1","YM3_2","YM4_1","YM4_2")


saveRDS(dat,"HSC_counts.rds")

#################################################################################################################################
countData=readRDS("HSC_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

design<-data.frame(cell=c(
"HSC","HSC","MPP1","MPP1","MPP2","MPP2","MPP3","MPP3","MPP4","MPP4",
"HSC","HSC","MPP1","MPP1","MPP2","MPP2","MPP3","MPP3","MPP4","MPP4"

                          ),
age=c(
"OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD","OLD",
"YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG","YOUNG"
)
)

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ cell + age )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)
saveRDS(vsd,"HSC_vsd.rds")

pdf("Diagnostic_pca_all_samples.pdf")
z=plotPCA(dLRT_vsd,ntop=20000,intgroup=c("cell","age"))
dev.off()

track=as.character(design$cell)
track[track=="HSC"]=1
track[track=="MPP1"]=2
track[track=="MPP2"]=3
track[track=="MPP3"]=4
track[track=="MPP4"]=5
track=as.numeric(track)
colores=c("#ffdfba","#ffb3ba","#ffffba","#baffc9","#bae1ff")
clab=as.character(colores[track])

track2=as.character(design$age)
track2[track2=="OLD"]=1
track2[track2=="YOUNG"]=2
track2=as.numeric(track2)
colores2=c("black","grey")
clab2=as.character(colores2[track2])

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

source("https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R")
sig_vsd = vsd[which(dLRT_res$padj<0.01),]

png("anova_heatmap.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,
          ColSideColors=cbind(Cell=clab,Age=clab2))
legend("topright",legend=c("HSC","MPP1","MPP2","MPP3","MPP4","OLD","YOUNG"),
       fill=c("#ffdfba","#ffb3ba","#ffffba","#baffc9","#bae1ff","black","grey"), border=T, bty="n" )
dev.off()


hc <- as.hclust( x$rowDendrogram )
groups=cutree( hc, k=5 )
track3=as.numeric(groups)
colores3=c("#4c516d","#e1cbcb","#db8d8d","#c7c1c7","#897689")
clab3=(colores3[track3])

png("anova_heatmap_obt.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,
          ColSideColors=cbind(Cell=clab,Age=clab2),RowSideColors=rbind(Clusters=clab3))
dev.off()

pdf("legends.pdf")
plot(NULL)
legend("center",legend=c("HSC","MPP1","MPP2","MPP3","MPP4","OLD","YOUNG"),
       fill=c("#ffdfba","#ffb3ba","#ffffba","#baffc9","#bae1ff","black","grey"), border=T, bty="n" )
dev.off()

write.table(names(which(groups==1)),"anova_cluster1.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==2)),"anova_cluster4.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==3)),"anova_cluster2.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==4)),"anova_cluster5.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==5)),"anova_cluster3.txt",sep="\t",quote=F,col.names=F,row.names=F)
#################################################################################################################################
# Fuzzy clustering
library(Mfuzz)
options(bitmapType="cairo")
require(Biobase)
library(RColorBrewer)
source("https://raw.githubusercontent.com/rtmag/taka/master/rna/mfuzz.plot.custom.R")

mean_old = cbind(HO=rowMeans(sig_vsd[,1:2]),
                 M1O=rowMeans(sig_vsd[,3:4]),
                 M2O=rowMeans(sig_vsd[,5:6]),
                 M3O=rowMeans(sig_vsd[,7:8]),
                 M4O=rowMeans(sig_vsd[,9:10]))
mean_old = mean_old[apply(mean_old,1,sd)!=0,]
              
mean_young = cbind(HY=rowMeans(sig_vsd[,11:12]),
                 M1Y=rowMeans(sig_vsd[,13:14]),
                 M2Y=rowMeans(sig_vsd[,15:16]),
                 M3Y=rowMeans(sig_vsd[,17:18]),
                 M4Y=rowMeans(sig_vsd[,19:20]))
mean_young = mean_young[apply(mean_young,1,sd)!=0,]
####################################################################################################################################
wt<-new("ExpressionSet", exprs=as.matrix(mean_old))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=9,m=mestimate(wt.s))
saveRDS(cl_wt,"cl_wt_9_Old.rds")
pdf('RNASEQ_mfuzz_Old_projectOld.pdf')
mfuzz.plot.custom(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("HSC_O","MPP1_O","MPP2_O","MPP3_O","MPP4_O"),
                  colo=brewer.pal(9,"PuBuGn"),cex.axis=.65)
dev.off()

wt<-new("ExpressionSet", exprs=as.matrix(mean_young))
wt.s<-standardise(wt)
pdf('RNASEQ_mfuzz_Old_projectYoung.pdf')
mfuzz.plot.custom(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("HSC_Y","MPP1_Y","MPP2_Y","MPP3_Y","MPP4_Y"),
                  colo=brewer.pal(9,"YlOrRd"),cex.axis=.65)
dev.off()

write.table(names(cl_wt$cluster[cl_wt$cluster==1]) ,"ct_1_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==2]) ,"ct_2_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==3]) ,"ct_3_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==4]) ,"ct_4_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==5]) ,"ct_5_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==6]) ,"ct_6_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==7]) ,"ct_7_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==8]) ,"ct_8_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==9]) ,"ct_9_rnaseq_Old.txt",quote=F,col.names=F,row.names=F,sep="\t")

wt<-new("ExpressionSet", exprs=as.matrix(mean_young))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=9,m=mestimate(wt.s))
saveRDS(cl_wt,"cl_wt_9_Young.rds")
pdf('RNASEQ_mfuzz_Young_projectYoung.pdf')
mfuzz.plot.custom(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("HSC_Y","MPP1_Y","MPP2_Y","MPP3_Y","MPP4_Y"),
                  colo=brewer.pal(9,"YlOrRd"),cex.axis=.65)
dev.off()

wt<-new("ExpressionSet", exprs=as.matrix(mean_old))
wt.s<-standardise(wt)
pdf('RNASEQ_mfuzz_Young_projectOld.pdf')
mfuzz.plot.custom(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("HSC_O","MPP1_O","MPP2_O","MPP3_O","MPP4_O"),
                  colo=brewer.pal(9,"YlOrRd"),cex.axis=.65)
dev.off()

write.table(names(cl_wt$cluster[cl_wt$cluster==1]) ,"ct_1_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==2]) ,"ct_2_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==3]) ,"ct_3_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==4]) ,"ct_4_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==5]) ,"ct_5_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==6]) ,"ct_6_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==7]) ,"ct_7_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==8]) ,"ct_8_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
write.table(names(cl_wt$cluster[cl_wt$cluster==9]) ,"ct_9_rnaseq_Young.txt",quote=F,col.names=F,row.names=F,sep="\t")
####################################################################################################################################








