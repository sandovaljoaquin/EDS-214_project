## Automate

#### *Running the entire analysis requires rendering one Quarto document*

Meets spec: I was able to run the entire analysis within paper.qmd and have a graph returned to me

#### The analysis runs without errors

Meets spec: I did not encounter any errors while running the quarto script

#### *The analysis produces the expected output*

Not yet?: renders a plot with each nutrient being represented on top of one another and includes the line marking hurricane hugo's occurence, has site information- looks like the plot isn't actually producing separate lines for each site though. Also it seems like none of the NH4 data is showing up but it should for every site other than PRM. 

#### *Data import/cleaning is handled in its own script(s)*

Meets spec: data cleaning and import are separate scripts- you can call these back in with source(here()) to clean up the top of your quarto even

## Organize

#### Raw data is contained in its own folder

Meets spec: everything is within 'data'

#### Intermediate outputs are created and saved to a separate folder from raw data

Not yet: any intermediate steps should be put in an 'outputs' folder according to Max

#### *At least one piece of functionality has been refactored into a function in its own file*

Meets spec: function for rolling average is within /R file

## Document

#### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

Not yet: Read me is currently empty but named

#### *The README includes a flowchart and text explaining how the analysis works*

Not yet: Still needs to be included in read me

#### *The code is appropriately commented*

Meets spec: Most code chunks have explanations and interpretations, you should add a roxygen skeleton to your function to exceed this expectation!

#### *Variable and function names are descriptive and follow a consistent naming convention*

Meets spec: Everything is descriptive, this might be nitpicky but I think to be safe you might want to go through and recheck capitalization and use of underscores in names to separate words. I only noticed deviations from lower snake in the cleaning and import and making mega_plot though.

## Scale

#### Running the environment initialization script installs all required packages

Not yet: I believe there needs to an initialization script that installs all the libraries you used since using the workbench you are in a different system.

#### The analysis script runs without errors

Meets spec: Ran and rendered without error, should work on the workbench based on that. 

## Collaborate


#### The repo has at least three closed GitHub issues

Not yet: You're about to resolve a bunch of stuff because you've done a great job!

#### The commit history includes at least one merged branch and a resolved merge conflict

Not yet: No current branches or resolved conflicts

#### The rendered analysis is accessible via GitHub Pages

Meets spec: just set up pages!
