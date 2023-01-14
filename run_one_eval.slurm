#!/bin/bash

#SBATCH --partition=physical

#SBATCH --job-name="loco_eval"
#SBATCH --account=punim1623
#SBATCH --time=0-00:30:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G

### SBATCH --mail-user=haitianh@student.unimelb.edu.au
### SBATCH --mail-type=BEGIN

module purge

eval "$(conda shell.bash hook)"
conda activate ds2

python -u evaluate_experiment.py \
--object_name "breakfast_box" \
--dataset_base_dir "mvtec_loco_ad" \
--anomaly_maps_dir "mvtec_loco_anomaly_maps_20230114_205638" \
--output_dir "breakfast_box_with_transformer" \


##Log this job's resource usage stats###
my-job-stats -a -n -s
##