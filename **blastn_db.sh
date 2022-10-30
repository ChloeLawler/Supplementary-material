#!/bin/bash

#PBS -l nodes=1:ppn=16
#PBS -l mem=48gb
#PBS -l walltime=100:00:00
#PBS -M lawler.chloe@gmail.com
#PBS -m ae
#PBS -j oe

module add blast+/2.9.0

cd /srv/scratch/z5255670/Primers/BLAST

for file in woestarget.fasta; do tag=${file%.fasta}; blastn -query "$tag".fasta -db DPANN_db -out "$tag"_blastn.tab -evalue 10e-100  -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen" -task blastn; done
