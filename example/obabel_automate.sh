#!/bin/bash

# Display a header message about the script
cat << "EOF"
            ########################################################################## 
            ##                                                                      ##
            ##                   Automated script for Openbabel                     ##
            ##                   Written by Gopinath Murugan                        ##
            ##       CAS in Crystallography and Biophysics, University of Madras    ##
            ##                   Email: murugangopinath12@gmail.com                 ##
            ##        https://github.com/Gopinath-Murugan/Openbabel-Automation      ## 
            ##                                                                      ##
            ########################################################################## 
EOF

# Prompt the user for the input file type
read -p "Enter the input file type (e.g., sdf): " input_type

# Prompt the user for the desired output format
read -p "Enter the desired output file format (e.g., pdb, pdbqt): " output_format

# Initialize the error log file
error_log="failed_compounds_list.txt"
> "$error_log" # Clear the file if it exists

# Loop through all files of the input type
for f in ./*.$input_type; do
    if [[ -f $f ]]; then
        lig=$(basename "$f" .$input_type)
        echo "Processing ligand $lig.$input_type"

        # Check if the desired output format is pdb
        if [[ $output_format == "pdb" ]]; then
            echo "Converting to pdb with energy minimization..."
            if ! obabel "$f" -O "$lig.$output_format"  --gen3D --h --minimize --n 50000 --sd --ff UFF; then
                echo "Error processing $lig.$input_type. Logging to $error_log."
                echo "$lig.$input_type" >> "$error_log"
            fi
        else
            echo "Converting to $output_format without energy minimization..."
            if ! obabel "$f" -O "$lig.$output_format"; then
                echo "Error processing $lig.$input_type. Logging to $error_log."
                echo "$lig.$input_type" >> "$error_log"
            fi
        fi
    else
        echo "No files with the extension .$input_type found."
        exit 1
    fi
done

echo "Conversion completed. Check $error_log for any errors."


