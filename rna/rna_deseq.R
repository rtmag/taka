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
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("cell","age"))
dev.off()


sig_vsd = vsd[which(dLRT_res$padj<0.05),]

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

png("anova_heatmap.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.3(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=rbind(clab,clab2))
legend("topright",legend=c("Normal","Melanoma","Nevi","MIS"),fill=c("#ffdfba","#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
