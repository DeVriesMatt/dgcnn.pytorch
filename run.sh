#!/bin/bash
#SBATCH --job-name=dgcnn
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gres=gpu:2
#SBATCH --time=96:00:00
#SBATCH --output=/data/scratch/DBI/DUDBI/DYNCESYS/mvries/PointMIL/outputs/dgcnn.txt
#SBATCH --error=/data/scratch/DBI/DUDBI/DYNCESYS/mvries/PointMIL/errors/dgcnn.txt
#SBATCH --partition=gpuhm
module load anaconda/3
source /opt/software/applications/anaconda/3/etc/profile.d/conda.sh

conda activate cs

export NCCL_SOCKET_IFNAME=^docker0,lo

for pool in "conjunctive" "additive" "attention" "instance"
do 
	python main_cls.py --model "$pool"
done
