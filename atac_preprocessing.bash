#########################################################################################
# remove dup HSC YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/1_Y-HSC_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/6_Y-HSC_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_2.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/Y-HSC_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_3.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_3.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/Y-HSC_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_4.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_4.mfile
#########################################################################################
# remove dup HSC AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/13_A-HSC_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/18_A-HSC_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_2.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/O-HSC_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_3.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_3.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/O-HSC_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_4.bam \
M=/root/taka/ATAC-seq/bam_rmdup/HSC_AGED_4.mfile
#########################################################################################
# remove dup MPP1 YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/2_Y-MPP1_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/7_Y-MPP1_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_2.mfile
#########################################################################################
# remove dup MPP1 AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/14_A-MPP1_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/19_A-MPP1_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_2.mfile
#########################################################################################
# remove dup MPP2 YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/3_Y-MPP2_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/8_Y-MPP2_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_2.mfile
#########################################################################################
# remove dup MPP2 AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/15_A-MPP2_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/20_A-MPP2_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_2.mfile
#########################################################################################
# remove dup MPP3 YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/4_Y-MPP3_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/9_Y-MPP3_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_2.mfile
#########################################################################################
# remove dup MPP3 AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/16_A-MPP3_1_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/21_A-MPP3_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_2.mfile
#########################################################################################
# remove dup MPP4 YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/5_Y-MPP4_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/10_Y-MPP4_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_2.mfile
#########################################################################################
# remove dup MPP4 AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/17_A-MPP4_1_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/22_A-MPP4_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_2.mfile
#########################################################################################
# remove dup GMP YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/25_Y-GMP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/31_Y-GMP_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_2.mfile
#########################################################################################
# remove dup GMP AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/28_A-GMP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/34_A-GMP_2_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/GMP_AGED_2.mfile
#########################################################################################
# remove dup MEP YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/26_Y-MEP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/32_Y-MEP_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_2.mfile
#########################################################################################
# remove dup MEP AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/29_A-MEP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/35_A-MEP_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/MEP_AGED_2.mfile
#########################################################################################
# remove dup CLP YOUNG
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/27_Y-CLP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/33_Y-CLP_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_2.mfile
#########################################################################################
# remove dup CLP AGED
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/30_A-CLP_1_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_1.bam \
M=/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/taka/ATAC-seq/bam/36_A-CLP_2_new_trimmed.fq.gz_Aligned.sortedByCoord.out.bam \
O=/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_2.bam \
M=/root/taka/ATAC-seq/bam_rmdup/CLP_AGED_2.mfile
######################################################################################################################################

samtools index /root/ong_dukenus/ATAC-SEQ/bam/shH2_I_1_rmdup.bam &
samtools index /root/ong_dukenus/ATAC-SEQ/bam/shH2_I_2_rmdup.bam &
samtools index /root/ong_dukenus/ATAC-SEQ/bam/shH2_II_1_rmdup.bam &
samtools index /root/ong_dukenus/ATAC-SEQ/bam/shH2_II_2_rmdup.bam &
samtools index /root/ong_dukenus/ATAC-SEQ/bam/shNT_1_rmdup.bam &
samtools index /root/ong_dukenus/ATAC-SEQ/bam/shNT_2_rmdup.bam &

bamCoverage -p max -bs 1 --normalizeUsing CPM \
-b /root/ong_dukenus/ATAC-SEQ/bam/shH2_I_1_rmdup.bam \
-o /root/ong_dukenus/ATAC-SEQ/bw/shH2_I_1_rmdup.bw
