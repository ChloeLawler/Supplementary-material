
oldfile = 'cas3_gi_edited.txt'

infile = open(oldfile,"r")
outfile = open('cas3phylogeny.txt',"w")

alllines = infile.readlines()

for line in alllines:
	if ">" in line:
		organism = line.split(" ", 1)[0]+ line.split("[")[1].split("]")[0]
		outfile.write(organism + "\n")
	else:
		outfile.write(line)

infile.close()
outfile.close()
