#! /bin/bash
# this file is snakemake.sh
#module load snakemake samtools || exit 1

export TMPDIR=/lscratch/$SLURM_JOB_ID

# ACTIVATE ANACONDA
source myconda
eval "$(conda shell.bash hook)"
conda activate RNA-seq

sbcmd="sbatch --cpus-per-task={threads}"

snakemake -pr --keep-going --local-cores $SLURM_CPUS_PER_TASK \
    --jobs 20 --cluster "$sbcmd" \
    --latency-wait 120 all
