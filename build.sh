# Creating star index for RNA-Seq
cd mm10_sjdbO100/
STAR --runThreadN 50 --runMode genomeGenerate --genomeDir /root/resources/mm10_sjdbO100/ \
--genomeFastaFiles /root/resources/mm10.fasta \
--sjdbGTFfile /root/resources/gencode.vM19.annotation.gtf --sjdbOverhang 100

cd ..

# No SJDB
cd mm10_noanno
STAR --runThreadN 50 --runMode genomeGenerate --genomeDir /root/resources/mm10_noanno/ \
--genomeFastaFiles /root/resources/mm10.fasta
####
###
#
