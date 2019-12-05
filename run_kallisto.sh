#this is code Dr. Stajich wrote
#!/usr/bin/bash
#SBATCH -p short -N 1 -n 8 --mem 8gb --out kallisto.log #this is how to run things on the cluster

CPUS=$SLURM_CPUS_ON_NODE
if [ -z $CPUS ]; then
 CPUS=1
fi

module load kallisto #load the module
SAMPLES=samples.csv #set the sample names
CDSFILE=M_tuberculosis.cds.fasta 
INDEX=Mtub.idx 
OUTDIR=kallisto_results #name of foler results will go in
FASTQDIR=fastq #name of directory with the fastq files
mkdir -p $OUTDIR
if [ ! -f $INDEX ]; then
    kallisto index -i $INDEX $CDSFILE
fi

IFS=,
tail -n +2 $SAMPLES | while read ACC CONDITION PH REPLICATE
do
    kallisto quant -i $INDEX -t $CPUS -o $OUTDIR/${CONDITION}_${PH}_r${REPLICATE} -l 300 --sd 20 --single $FASTQDIR/${ACC}.fastq.gz
done
