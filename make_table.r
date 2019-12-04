#Open file as dataframe
g571 = read.csv('g571.tsv',sep="\t",header=T) #file is tab delimited and has headers

#assign columns to variables as vectors
Gene_Locus = g571[[1]]
Gene_Length = g571[[2]]  

#get protein length from gene length
Protein_Length = Gene_Length / 3

#Make Average TPM vectors
glycerol57_tpm1 = g571[[5]]
g572 = read.csv('g572.tsv',sep="\t",header=T)
glycerol57_tpm2 = g572[[5]]
Glycerol_5.7_TPM = (glycerol57_tpm1 + glycerol57_tpm2) / 2

g71 = read.csv('g71.tsv',sep="\t",header=T)
g72 = read.csv('g72.tsv',sep="\t",header=T)
glycerol7_tpm1 = g71[[5]]
glycerol7_tpm2 = g72[[5]]
Glycerol_7_TPM = (glycerol7_tpm1 + glycerol7_tpm2) / 2

p571 = read.csv('p71.tsv',sep="\t",header=T)
Pyruvate_5.7_TPM = p571[[5]]

p71 = read.csv('p71.tsv',sep="\t",header=T)
p72 = read.csv('p72.tsv',sep="\t",header=T)
pyruvate7_tpm1 = p71[[5]]
pyruvate7_tpm2 = p72[[5]]
Pyruvate_7_TPM = (pyruvate7_tpm1 + pyruvate7_tpm2) / 2

#make our own dataframe from vectors
summary.data = data.frame(Gene_Locus, Protein_Length, Glycerol_5.7_TPM, Glycerol_7_TPM, Pyruvate_5.7_TPM, Pyruvate_7_TPM)

# Write dataframe to tab delimited file
write.table(summary.data,"MyData.txt",sep="\t",row.names=FALSE)

 
