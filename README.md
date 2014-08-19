Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data Course Project

Download this script in an empty directory and souce it.

When sourcing, at the very beginning script sets the directory it stored in as a working directory for further operations. Then it will automatically runs `dataset()` function which downloads and unzip the data file, moves all unzipped files to the working directory and removes downloaded *.zip file and unnecessary directories created during unzipping.

After downloading data the internal function `groupdf()` is created. This function will merge "train" and "test" datasets,  creates one tidy dataset and labels data. Thet it will extracts `mean` and `std` for each measurement.

At the end `final()` function will be executed. This function will create "complete.csv" with all the data and "simple.csv" with the average of each variable for each activity and each subject.
