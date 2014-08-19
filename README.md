Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data Course Project

Download this script in an empty directory and souce it. If you using MSWindows, please skip to the Windows section of this file for instructions.

When sourcing, at the very beginning script sets the directory it stored in as a working directory for further operations. Then it will automatically runs `dataset()` function which downloads and unzip the data file, moves all unzipped files to the working directory and removes downloaded *.zip file and unnecessary directories created during unzipping.

After downloading data the internal function `groupdf()` is created. This function will merge "train" and "test" datasets,  creates one tidy dataset and labels data. Thet it will extracts `mean` and `std` for each measurement.

At the end `final()` function will be executed. This function will create "complete.csv" with all the data and "simple.csv" with the average of each variable for each activity and each subject.

##Windows

1. Create directory of your choice.
2. Download `runing_analysis.R` to this directory.
3. Open downloaded file in RStudio or other code editor.
4. Change from `method=curl` to `method=auto` in 5th row in `runing_analysis.R` file and the source rows 4 and 5 from this file. This will download all needed data and saves it as `data.zip` file in your working directory.
5. Comment out lines 1-10 of `runing_analysis.R`.
6. Unzip downloaded file manually. All extracted files and folders should be directly in your working directory not in the `UCI HAR Dataset` subdir.
7. Source `runing_analysis.R` file.
