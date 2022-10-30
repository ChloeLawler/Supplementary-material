#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l mem=60gb
#PBS -l walltime=12:00:00
#PBS -M f.macleod@unsw.edu.au
#PBS -m ae
#PBS -j oe


cd /srv/scratch/z5018325/DasToolALL/DasToolALL_DASTool_bins/Hightomed/Prodigal/Phylosift

module add perl/5.28.0

perl catfasta2phyml.pl -f -v --concatenate DNGNGWU00001.mafft_endtrimmed.faa DNGNGWU00002.mafft_endtrimmed.faa DNGNGWU00003.mafft_endtrimmed.faa DNGNGWU00005.mafft_endtrimmed.faa DNGNGWU00006.mafft__endtrimmed.faa DNGNGWU00007.mafft__endtrimmed.faa DNGNGWU00009.mafft_endtrimmed.faa DNGNGWU00010.mafft_endtrimmed.faa DNGNGWU00011.mafft_endtrimmed.faa DNGNGWU00012.mafft_endtrimmed.faa DNGNGWU00013.mafft_endtrimmed.faa DNGNGWU00014.mafft_endtrimmed.faa DNGNGWU00015.mafft_endtrimmed.faa DNGNGWU00016.mafft_endtrimmed.faa DNGNGWU00017.mafft_endtrimmed.faa DNGNGWU00018.mafft_endtrimmed.faa DNGNGWU00019.mafft__endtrimmed.faa DNGNGWU00020.mafft_endtrimmed.faa DNGNGWU00021.mafft_endtrimmed.faa DNGNGWU00022.mafft_endtrimmed.faa DNGNGWU00023.mafft_endtrimmed.faa DNGNGWU00024.mafft_endtrimmed.faa DNGNGWU00025.mafft_endtrimmed.faa DNGNGWU00026.mafft_endtrimmed.faa DNGNGWU00027.mafft_endtrimmed.faa DNGNGWU00028.mafft_endtrimmed.faa DNGNGWU00029.mafft_endtrimmed.faa DNGNGWU00030.mafft_endtrimmed.faa DNGNGWU00031.mafft_endtrimmed.faa DNGNGWU00032.mafft_endtrimmed.faa DNGNGWU00033.mafft_endtrimmed.faa DNGNGWU00034.mafft_endtrimmed.faa DNGNGWU00035.mafft_endtrimmed.faa DNGNGWU00036.mafft_endtrimmed.faa DNGNGWU00037.mafft_endtrimmed.faa DNGNGWU00039.mafft_endtrimmed.faa > concatenatedmarkers_endtrimmed.faa
