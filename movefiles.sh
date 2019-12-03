bash link_files.sh
git clone https://gist.github.com/b1c872a9ff794b977ad072ffc8883251.git
cd b1c872a9ff794b977ad072ffc8883251/
cp run_kallisto.sh ..
cp samples.csv ..
cp run_pfam.sh ..
cd ..
sbatch run_kallisto.sh
cd kallisto_results
cd Glycerol_5.7_r1
-v abundance.tsv g571.tsv
cp g571.tsv ../..
cd Glycerol_5.7_r2
-v abundance.tsv g572.tsv
cp g572.tsv ../..
cd Glycerol_7_r1
-v abundance.tsv g71.tsv
cp g71.tsv ../..
cd Glycerol_7_r2
-v abundance.tsv g72.tsv
cp g72.tsv ../..
cd Pyruvate_5.7_r1
-v abundance.tsv p571.tsv
cp p571.tsv ../..
cd Pyruvate_7_r1
-v abundance.tsv p71.tsv
cp p71.tsv ../..
cd Pyruvate_7_r2
-v abundance.tsv p72.tsv
cp p72.tsv ../..
