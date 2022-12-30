#!/bin/bash

###SBATCH --partition=gpu-a100

#SBATCH --partition=deeplearn
#SBATCH --qos=gpgpudeeplearn
###SBATCH --constraint=dlg1

#SBATCH --job-name="loco_eval"
#SBATCH --account=punim1623
#SBATCH --time=0-01:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
###### "ntasks-per-node" should have same value as "res=gpu:"

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G

### SBATCH --mail-user=haitianh@student.unimelb.edu.au
### SBATCH --mail-type=BEGIN

module purge

eval "$(conda shell.bash hook)"
conda activate ds2

python -u evaluate_experiment.py \
--object_name "juice_bottle" \
--dataset_base_dir "mvtec_loco_ad" \
--anomaly_maps_dir "mvtec_loco_anomaly_maps" \
--output_dir "juice_bottle_first_trial" \


##Log this job's resource usage stats###
my-job-stats -a -n -s
##