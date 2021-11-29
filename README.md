# Getting and Cleaning Data Course Project
Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Repository files

* __CodeBook.MD__: is a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data. 

* __README.MD__: this file.

* __run_analysis.R__: is a file containing the R programming code to perform the data analysis.

* Rest all files are extracted from the zipped Data.

Before running the code you will need to decide where you want your working directory to be then save `run_analysis.R` to this directory.

You will also need a copy of the raw data, download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your working directory and then unzip it.
Alternatively, you can clone this repository which has already unzipped data and all necessary scripts. 

Finally, open an R console of your choice, set the working directory to the `UCI HAR Dataset`, where you saved `run_analysis.R`.  You can also use `setwd()` function with appropriate working directory name. 

Execute the script by the command `source("run_analysis.R")`.

Note that executing this script will create a "tidyData.csv" file (in your working directory) containing the tidy data set.