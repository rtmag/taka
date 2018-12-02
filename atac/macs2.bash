#ls -1 /root/taka/ATAC-seq/bam_rmdup/*bam|perl -pe 's/(.+)\n/macs2 callpeak \-t $1 \-f BAM \-\-keep\-dup all \-\-nomodel \\
#\-\-broad \-g mm \-\-outdir \/root\/taka\/ATAC\-seq\/macs2\/ \-n HOLAMUNDO$1 \& \n\n/g'|perl -pe 's/\-n.+bam_rmdup\//\-n BROAD_/g'

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_CLP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_CLP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_CLP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_CLP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_GMP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_GMP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_GMP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_GMP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_3.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_AGED_3.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_4.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_AGED_4.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_3.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_YOUNG_3.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_4.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_HSC_YOUNG_4.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MEP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MEP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MEP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MEP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP1_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP1_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP1_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP1_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP2_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP2_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP2_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP2_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP3_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP3_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP3_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP3_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP4_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP4_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP4_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
--broad -g mm --outdir /root/taka/ATAC-seq/macs2/ -n BROAD_MPP4_YOUNG_2.bam & 

#ls -1 /root/taka/ATAC-seq/bam_rmdup/*bam|perl -pe 's/(.+)\n/macs2 callpeak \-t $1 \-f BAM \-\-keep\-dup all \-\-nomodel \\
#\-g mm \-\-outdir \/root\/taka\/ATAC\-seq\/macs2\/ \-n HOLAMUNDO$1 \& \n\n/g'|perl -pe 's/\-n.+bam_rmdup\//\-n NARROW_/g'

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_CLP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_CLP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_CLP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/CLP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_CLP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_GMP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_GMP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_GMP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/GMP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_GMP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_3.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_AGED_3.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_AGED_4.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_AGED_4.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_3.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_YOUNG_3.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/HSC_YOUNG_4.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_HSC_YOUNG_4.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MEP_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MEP_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MEP_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MEP_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MEP_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP1_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP1_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP1_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP1_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP1_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP2_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP2_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP2_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP2_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP2_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP3_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP3_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP3_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP3_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP3_YOUNG_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP4_AGED_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_AGED_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP4_AGED_2.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_1.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP4_YOUNG_1.bam & 

macs2 callpeak -t /root/taka/ATAC-seq/bam_rmdup/MPP4_YOUNG_2.bam -f BAM --keep-dup all --nomodel \
-g mm --outdir /root/taka/ATAC-seq/macs2/ -n NARROW_MPP4_YOUNG_2.bam & 


