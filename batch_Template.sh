#!/bin/bash
#SBATCH --job-name=job_Name
#SBATCH --output=logs/job_Name%A_%a.out
#SBATCH --error=logs/job_Name%A_%a.err
#SBATCH --partition=secondgen,firstgen,fastgen,lastgen,newgen,gnt,dellgen
#SBATCH --cpus-per-task=1
#SBATCH --array=1-5:1
#SBATCH --share
#SBATCH --mem-per-cpu=5000
#SBATCH --exclude=node[1-7], node37
#SBATCH --mail-user=your@email.com
#SBATCH --mail-type=ALL


cd /shared/projects/project_name_in_lowercase_letters/path/to/dedicated/folder

output_file="job_Name_$SLURM_ARRAY_TASK_ID.out"

/home/username/R/bin/R CMD BATCH --no-save --no-restore "--args $SLURM_ARRAY_TASK_ID" script_Name.R "$output_file"
