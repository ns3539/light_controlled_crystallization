#!/bin/bash

submit_simulation () 
{
    
    seed=$1

    current_dir=$(pwd)

    
    mkdir "seed${seed}"
    cp run.yaml "seed${seed}"
    cp first_frame_onlyP.xyz "seed${seed}"
    cp run_simulation.sbatch "seed${seed}"
    cd "seed${seed}"
    sed -i "s/_SEED/${seed}/g" run.yaml
  
    sbatch run_simulation.sbatch
    cd - 
   
}

for seed in 1 3 4;do
    submit_simulation $seed
done