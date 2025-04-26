#Align coding_13 with the superoxide dismutase [Cu-Zn] [Danio aesculapii] 
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa

#Select only exons features and save it in a gff
exonerate -m p2g --showtargetgff -q danio_aesculapii.fa -t contig_13.fa -S F | egrep -w exon > contig_13.exonerate.gff

#Using bedtools to get the exon sequences in fasta fromat
bedtools getfasta -fi danio_aesculapii.fa -bed contig_13.exonerate.gff > exonerate_cotntig_133.fa

# Made in google colab
from google.colab import files
uploaded = files.upload()

# Show the first 2 lines of the contig_13.fa file
!head -n 2 /content/contig_13.fa
# Show the first 2 lines of the protein_hit.fa file
!head -n 2 /content/protein_hit.fa

# Install samtools if it's not already installed
!apt-get install samtools

# Generate the index for contig_13.fa
!samtools faidx /content/contig_13.fa

# Verify that the index has been created correctly
!ls -l /content/contig_13.fa.fai

# Run Exonerate to align the protein to the genomic sequence
!exonerate -m p2g --showtargetgff -q /content/protein_hit.fa -t /content/contig_13.fa -S F > exonerate_output.gff

# Filter the exons from the GFF file
!egrep -w exon exonerate_output.gff > exonerate_exons.gff

# Install bedtools if it's not already installed
!apt-get install bedtools

# Extract the exon sequences using bedtools
!bedtools getfasta -fi /content/contig_13.fa -bed exonerate_exons.gff > predicted_exons.fa

# Clean the file so that the sequences are in a single line
!sed -e '2,$s/>.*//' predicted_exons.fa | grep -v '^$' > predicted_singleline.fa

# Using bedtools to get the exon sequences in fasta format
bedtools getfasta -fi danio_aesculapii.fa -bed contig_13.exonerate.gff > exonerate_contig_13.fa
