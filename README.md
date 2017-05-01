# Project_Clean_Data
# This is how I have my data cleaned.
# 1.I read each files into a dataset seperately. I temporarily group data into X, Y and sub (one for each subfolder)
# 2.I found out columns containing mean and std in their names using regular expression.I only read those
#columns whose names are qualified.
# 3.I read avivity labels from the corresponding .txt and replace numbers with proper labels to lable Y
# 4.I combined all datasets into one clean dataset and save to file
# 5.I used aggregate from library(plyr) to calculate the mean by subject and activity
# 6.I dropped column subject and activity as they are all "NA" and write the result to a new .txt file

# List of references
# https://github.com/foxyreign/Getting-and-Cleaning-Data/blob/master/run_analysis.R
# https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html

