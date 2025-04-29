#Shell script for ab-initio methods
#This code is used to get the sequences of the geneid prediction from its locations and the original fasta, using bedtools
bedtools getfasta -fi contig_13.fa -bed geneid_locations.gff -fo geneid_13.fa 

#This code is used to merge the exons of GeneID in one single document
echo ">geneid_13"\ > geneid_13_singleline.fa 
sed -e 's/>contig_13:281-389//' -e 's/>contig_13:4961-5033//' geneid_13.fa | grep -v '^$' >> geneid_13_singleline.fa

#This code is used to put all predictions together in a single file to run a T Coffee with just the ab-initio methods
cat fgenesh_13.fa geneid_13_singleline.fa > contig_13_abinitio.fa

#This code is used to put Fgenesh prediction with the homology based prediction to run a second T Coffee
cat fgenesh_13.fa danio_rerio.fa danio_aesculapii.fa > contig_13_allpredicted.fa

