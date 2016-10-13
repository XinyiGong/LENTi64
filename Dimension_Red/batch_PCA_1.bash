# PACE_matlab_test
#PBS -N PACE_matlab_test
#PBS -l nodes=1:ppn=1
#PBS -l pmem=16gb
#PBS -l walltime=12:00:00
#PBS -q prometheus
#PBS -j oe
#PBS -o matlog
#PBS -m abe
#PBS -M adotsenko3@gatech.edu

cd nv/hp22/xgong42/scratch/PCA_11_15_2015
module load matlab
matlab -r "GB_to_PCA.m"