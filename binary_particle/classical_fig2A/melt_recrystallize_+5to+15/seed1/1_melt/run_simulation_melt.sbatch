#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --time=2-00:00:00
#SBATCH --mem=4GB
#SBATCH --output=output/openmm_replicate_%a.out
#SBATCH --error=error/openmm_replicate_%a.err

module purge

singularity exec --nv \
  --overlay /scratch/projects/hockygroup/ns3539/conda_openmm_for_testing/overlay-10GB-400K.ext3:ro \
  /scratch/work/public/singularity/cuda12.3.2-cudnn9.0.0-ubuntu-22.04.4.sif \
  /bin/bash -c "
  source /ext3/env.sh;
  colloids-run run_melt.yaml
"