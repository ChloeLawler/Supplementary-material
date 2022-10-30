import os
import csv

path = '/srv/scratch/z5255670/damnthisagain'
os.chdir(path)

markers = []
sequences = {}
with open('PS_markers.txt', 'r') as r:
    reader = csv.reader(r, delimiter = '\t')
    for row in reader:
        markers.append(row[0])
        sequences[row[0]] = []
print(markers)

list_of_genomes = []

for subdir, dirs, files in os.walk(path):
    for file in files:
        print(subdir)
        organism = '>' + subdir.split('/')[-2]
        if not organism[1:] in list_of_genomes:
            list_of_genomes.append(organism[1:])
        if file.endswith('1.1'):
            location = os.path.join(subdir, file)
            marker = file.split('.')[0]
            if marker in sequences.keys():
                temp_list = sequences[marker]
                with open(location, 'r') as r:
                    lines = r.readlines()
                    count = 0
                    for line in lines:
                        if count == 0:
                            temp_list.append(organism + '\n')
                            count += 1
                        elif count == 1:
                            temp_list.append(line.replace('*', ''))
                            count += 1
                sequences[marker] = temp_list
print(sequences)

for key in sequences:
    with open(key, 'w') as w:
        temp_list = sequences[key]

        for item in temp_list:

            w.writelines(item)

organism_list = []
temp_list = []
with open('summary.txt', 'w', newline='') as w:
    writer = csv.writer(w, delimiter = ',')
    writer.writerow(['marker', list_of_genomes])
    for key in sequences:
        temp_list = []
        for genome in list_of_genomes:
            print(genome)
            found = False
            sequence_list = sequences[key]
            for item in sequence_list:
                if genome in item:
                    found = True
            if found == True:
                temp_list.append('1')
            else:
                temp_list.append('0')

            writer.writerow([key, temp_list])
