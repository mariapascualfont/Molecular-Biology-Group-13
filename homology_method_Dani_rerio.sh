#The following document contains the shell script that guides from the alignment of contig_13 and (the gene coding for) protein NP_571369.1.

#we use exonerate to analyze the alignment data
#from that we can derive number introns/exons (their site and length) as well as the quality of the alignment
exonerate -m p2g --showtargetgff -q Zebrafish_contig13.fa -t contig_13.fa

#select only exon features
exonerate -m p2g --showtargetgff -q Zebrafish_contig13.fa -t contig_13.fa -S F| egrep -w exon > Zebrafish.exonerate.gff

#now we extract the exons and store them in a new fasta file
#in our case the bedtools command did not work right away, so we installed and used samtools faidx 
#samtools faidx creates an index that allows bedtools to access specific region of the fasta file (contig_13.fa) faster
bedtools getfasta -fi contig_13.fa -bed Zebrafish.exonerate.gff >exonerate_Zebrafish.fa
