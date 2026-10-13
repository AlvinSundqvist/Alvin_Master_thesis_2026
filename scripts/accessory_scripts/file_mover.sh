#!/bin/bash

# Define the file-paths for the respective samples
METAGENOME_PATH=/storage/alvin/HiC_stuff/Raw_data/Metagenomes/files
HIC_PATH=/storage/alvin/HiC_stuff/Raw_data/HiC_reads/files

METAGENOME_SAMPLES=("P35760_101" "P35760_102" "P35760_104" "P35760_105" "P35760_106" "P35760_107" "P35760_108") # Metagenome-samples
HIC_SAMPLES=("P35759_1001" "P35759_1002" "P35759_1003" "P35759_1004" "P35759_1005" "P35759_1006" "P35759_1007") # HiC-samples


# A loop that moves the pair-end fastq-files out of their nested directories into each sample's respective top-level directory, e.g. 'P35759_1001_S595_L008_R2_001.fastq.gz' into 'P35759_1001'

# Two FOR-loops, each one iterating over the samples present in the directory
# Metagenome-loop
for sample in ${METAGENOME_SAMPLES[@]}; do
    echo "Now moving sample: ${METAGENOME_PATH}/${sample}"
    mv "${METAGENOME_PATH}/${sample}/02-FASTQ/20250711_LH00202_0252_A22MH32LT4/${sample}_"*"_R1_001.fastq.gz" ${METAGENOME_PATH}/${sample} # Wildcards can't be "embedded" inside double-quotes '" "'? The wildcard is therefore placed
                                                                                                                                           # inbetween two sets of double-quoted strings.
    mv "${METAGENOME_PATH}/${sample}/02-FASTQ/20250711_LH00202_0252_A22MH32LT4/${sample}_"*"_R2_001.fastq.gz" ${METAGENOME_PATH}/${sample}
done

# HiC-loop
for sample in ${HIC_SAMPLES[@]}; do
    echo "Now moving sample: ${HIC_PATH}/${sample}"
    mv "${HIC_PATH}/${sample}/02-FASTQ/20250523_LH00217_0217_A232ML2LT3/${sample}_"*"_R1_001.fastq.gz" ${HIC_PATH}/${sample}
    mv "${HIC_PATH}/${sample}/02-FASTQ/20250523_LH00217_0217_A232ML2LT3/${sample}_"*"_R2_001.fastq.gz" ${HIC_PATH}/${sample}
done
