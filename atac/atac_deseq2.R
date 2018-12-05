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

pdf("Diagnostic_pca_all_samples.pdf")
plotPCA(dLRT_vsd,ntop=20000,intgroup=c("cell","age"))
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
colores=c("#ffdfba","#ffb3ba","#ffffba","#baffc9","#bae1ff",
          "#eecbff","#836953","#52494c")
clab=as.character(colores[track])

track2=as.character(design$age)
track2[track2=="OLD"]=1
track2[track2=="YOUNG"]=2
track2=as.numeric(track2)
colores2=c("black","grey")
clab2=as.character(colores2[track2])
