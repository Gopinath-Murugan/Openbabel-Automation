# Compound Conversion Script

This script facilitates the conversion of chemical compounds from one file format to another using **Open Babel**. It also includes optional energy minimization for files converted to `.pdb` format. Compounds that fail to convert are logged into a file named `failed_compounds_list.txt`.

## Prerequisites

Before running the script, ensure the following:

1. **Install Open Babel**:
   - Open Babel must be installed from source. Follow these steps to install it:
     ```bash
     # Clone the Open Babel repository
     git clone https://github.com/openbabel/openbabel.git
     cd openbabel
     
     # Create a build directory and navigate into it
     mkdir build && cd build
     
     # Configure the build
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
     
     # Compile and install
     make
     sudo make install
     ```
   - Verify the installation by running:
     ```bash
     obabel --version
     ```

2. **Script and Files Location**:
   - Place the script and all compound files in the **same directory**.
   - Ensure the input files have the correct extension (e.g., `.sdf`).

## How to Use

Follow these steps to use the script:

1. **Navigate to the Directory**:
   - Open a terminal and navigate to the folder containing the script and compound files:
     ```bash
     cd /path/to/your/files
     ```

2. **Run the Script**:
   - Make the script executable:
     ```bash
     chmod +x obabel_automate.sh
     ```
   - Run the script:
     ```bash
     ./obabel_automate.sh
     ```

3. **Follow the Prompts**:
   - Enter the input file type (e.g., `sdf`) when prompted.
   - Enter the desired output file format (e.g., `pdb`, `pdbqt`) when prompted.

4. **Review the Results**:
   - Converted files will appear in the same directory as the input files.
   - Any files that failed to convert will be logged in `failed_compounds_list.txt`.

## Features

- **Dynamic Input and Output Formats**:
  - The script dynamically handles file type and format conversions based on user input.
- **Energy Minimization**:
  - Energy minimization is applied only if converting files to `.pdb` format.
- **Error Logging**:
  - Failed conversions are logged in `failed_compounds_list.txt` for troubleshooting.

## Example Workflow

1. Place the script and input files (e.g., `compound1.sdf`, `compound2.sdf`) in the same directory.
2. Run the script:
   ```bash
   ./obabel_automate.sh
   ```
3. Enter:
   - Input file type: `sdf`
   - Output file format: `pdb`
4. The script will process each compound, apply energy minimization for `.pdb` files, and log any failures.

## Notes

- The script assumes all input files are in the specified format. If no matching files are found, it will exit with a message.
- For troubleshooting, review the `failed_compounds_list.txt` file and rerun the script for only the problematic compounds.

## Acknowledgment

If you are using this script for your studies, kindly acknowledge us in your publications or research. We appreciate your support!


