#!/bin/bash



#PBS -l nodes=1:ppn=4
#PBS -l mem=60gb
#PBS -l walltime=24:00:00
#PBS -M lawler.chloe@gmail.com
#PBS -m ae
#PBS -j oe


cd /srv/scratch/z5255670/phylogenyhehe

module add mafft/7.407

for f in /srv/scratch/z5255670/phylogenyhehe/DNGNGWU*; do
  mafft-linsi --thread 4 "$f" > "$f".mafft.faa
done
