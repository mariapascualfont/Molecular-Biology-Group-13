#Align coding_13 with the superoxide dismutase [Cu-Zn] [Danio aesculapii] 
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa

#Select only exons features and save it in a gff
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa -S F | egrep -w exon > contig_13.exonerate.gff

#Using bedtools to get the exon sequences in fasta fromat
