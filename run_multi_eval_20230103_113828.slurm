#!/bin/bash

#SBATCH --partition=physical

#SBATCH --job-name="loco_eval"
#SBATCH --account=punim1623
#SBATCH --time=0-02:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G

### SBATCH --mail-user=haitianh@student.unimelb.edu.au
### SBATCH --mail-type=BEGIN

module purge

eval "$(conda shell.bash hook)"
conda activate ds2

timestamp="20230103_113828"

ln -s /data/gpfs/projects/punim1623/RevDis/mvtec_loco_anomaly_maps_${timestamp} ./mvtec_loco_anomaly_maps_${timestamp}

python -u evaluate_multiple_experiments.py \
--dataset_base_dir "mvtec_loco_ad" \
--experiment_configs "experiment_configs_${timestamp}.json" \
--output_dir "multi_experiments_results_${timestamp}" \


##Log this job's resource usage stats###
my-job-stats -a -n -s
##