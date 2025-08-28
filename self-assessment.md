## Automate

#### Running the entire analysis requires rendering one Quarto document

Meets Specs. All required code for the analysis is within the Quarto document.

#### The analysis runs without errors

Meets Specs. No errors within the Quarto doc.

#### The analysis produces the expected output

Does not meet specs. After using the provided moving average function and plotting, the output of the plot looks like it only contains one of the sites.

#### Data import/cleaning is handled in its own script(s)

Meets specs. I've designated one script for data import and one script for data cleaning.

## Organize

#### Raw data is contained in its own folder

Meets specs. Inside 'data' folder.

#### Intermediate outputs are created and saved to a separate folder from raw data

Does not meet specs. I need to create a fig folder to house the ggplot.pngs produced.

#### At least one piece of functionality has been refactored into a function in its own file

Meets Specs. The moving average used in the quarto document was refactored into a function in an rscript.

## Document

#### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

Does not meet specs. I need to recreate my read.me

#### The README includes a flowchart and text explaining how the analysis works

Does not meet specs.

#### The code is appropriately commented

Meets specs. I've described several important steps above the code chunks.

#### Variable and function names are descriptive and follow a consistent naming convention

Does not meet specs. I need to go back and rename variables.

## Scale

#### After cloning the repo on Workbench:

#### Running the environment initialization script installs all required packages

Meets specs. 

#### The analysis script runs without errors

Meets specs.

