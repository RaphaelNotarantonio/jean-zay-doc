#!/bin/bash
#SBATCH --job-name=pytorch_mnist     # job name
#SBATCH --ntasks=1                   # number of MP tasks
#SBATCH --ntasks-per-node=1          # number of MPI tasks per node
#SBATCH --gres=gpu:1                 # number of GPUs per node
#SBATCH --cpus-per-task=10           # number of cores per tasks
#SBATCH --hint=nomultithread         # we get physical cores not logical
#SBATCH --distribution=block:block   # we pin the tasks on contiguous cores
#SBATCH --time=3:00:00              # maximum execution time (HH:MM:SS)
#SBATCH --output=pytorch_mnist%j.out # output file name
#SBATCH --error=pytorch_mnist%j.err  # error file name

set -x
cd ${SLURM_SUBMIT_DIR}

module purge
module load pytorch-gpu/py3/1.4.0 

python ./mnist_example.py 
