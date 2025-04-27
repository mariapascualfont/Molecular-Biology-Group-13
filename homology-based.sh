#The following shell script guides through the process from the alignment of contig_13 and (the gene coding for) the species protein
#We conducted the shell script for the species respectively, as the commands remain the same.
#The commands are based on the species Danio Aesculapii. All files are in the same working directory
#For the other species we just replaced the species in the name of the files

#Align coding_13 with the superoxide dismutase [Cu-Zn] [Danio aesculapii] 
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa

#Select only exons features and save it in a gff
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa -S F | egrep -w exon > danio_aesculapii.exonerate.gff

# Install samtools if it's not already installed
sudo apt install samtools

# Generate the index for contig_13.fa
samtools faidx contig_13.fa

# Verify that the index has been created correctly
ls -l contig_13.fa.fai

# Extract the exon sequences using bedtools
bedtools getfasta -fi contig_13.fa -bed danio_aesculapii.exonerate.gff >exonerate_danio_aesculapii.fa

# Ceate a new file so that the exon sequences are in a single line
sed -e '2,$s/>.*//' exonerate_danio_aesculapii.fa | grep -v '^$' >exonerate_danio_aesculapii_single_line.fa

