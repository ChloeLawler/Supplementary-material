#!/bin/bash

#PBS -j oe
#PBS -l nodes=1:ppn=8
#PBS -l mem=12gb
#PBS -l walltime=8:00:00
#PBS -M Lawler.chloe@gmail.com
#PBS -m ae
#PBS -J 1-11

BIN_DIR=/srv/scratch/z5255670/phylo/

cd ${BIN_DIR}

module add perl/5.28.0
module add hmmer/3.2.1
module add prodigal/2.6.3
module add pplacer/1.1.alpha19
module add raxml/8.2.12
module add fasttree/2.1.10
module add phylosift/1.0.1

BINS=( "0" "bin.1512_sub.proteins.faa")
sleep $(($RANDOM % 240))

((START_NUMBER = (${PBS_ARRAY_INDEX} - 1 ) * 2 + 1))
((END_NUMBER = ${START_NUMBER} + 1))

	for i in `(seq $START_NUMBER $END_NUMBER)`
	do
	phylosift all --keep_search --output ${BINS[i]%.fasta}.1 ${BINS[i]} --debug
	done