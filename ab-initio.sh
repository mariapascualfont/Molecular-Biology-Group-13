#Shell script for ab-initio methods
#This code is used to get the sequences of the geneid prediction from its locations and the original fasta, using bedtools
bedtools getfasta -fi contig_13.fa -bed geneid_locations.gff -fo geneid_13.fa 
