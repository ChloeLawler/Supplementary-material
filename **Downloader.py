import ftputil
import string
import os-sys
import sys
import csv

os.chdir('/srv/scratch/z5255670/downloading')

#Set location to download genomes to
base_path="/srv/scratch/z5255670/downloading"

#Set the host to the NCBI file transfer site
host = ftputil.FTPHost('ftp.ncbi.nlm.nih.gov', 'anonymous', 'password')

#Directory paths for genomes must be in a csv formatted as Identifier,FTP_Directory_Path, Scaffolds
with open('prokaroytes_database.csv', 'r') as f:
    reader = csv.reader(f, delimiter=",")
    next(reader)

    #Loop to go through all genomes
    for row in reader:
        if int(row[2]) < 100:

            directory = row[1]

            #First 20 characters are ignored because they are the host address, if this is not present in input file then remove this line
            sliced_directory = directory[26:]

            #Navigate to genome file locations
            host.chdir(sliced_directory)
            file_list = host.listdir(host.curdir)
            for file_name in file_list:
                print(file_name)
                #Download all files of the defined extensions unless they already exist into folders using the identifier in the input file as directory names
                if file_name[-7:]==".faa.gz" or file_name[-7:]==".gff.gz" or file_name[-7:]=="ort.txt":
                    print(file_name)
                    if not os.path.isdir(os.path.join(base_path,row[0])):
                        os.chdir(base_path)
                        os.mkdir(os.path.join(base_path,row[0]))

                    if os.path.isfile(os.path.join(base_path,row[0],file_name)):
                        print( "Skipping file " \
                            +os.path.join(base_path,row[0],file_name))
                    elif host.path.isfile(file_name):
                        print( "Downloading File " \
                            + os.path.join(base_path,row[0],file_name))
                        host.download(file_name, \
                                      os.path.join(base_path,row[0],file_name))
                    else :
                        print( "Error - Not a file " + row[1] + "/" + file_name)
