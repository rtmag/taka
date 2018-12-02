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
isPairedEnd=TRUE,
#PE_orientation="rf",
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)
sink()

dat=data[[1]]
colnames(dat)=c("OH1","OH2","OM1_1","OM1_2","OM2_1","OM2_2","OM3_1","OM3_2","OM4_1","OM4_2",
"YH1","YH2","YM1_1","YM1_2","YM2_1","YM2_2","YM3_1","YM3_2","YM4_1","YM4_2",)

saveRDS(dat,"HSC_counts.rds")
