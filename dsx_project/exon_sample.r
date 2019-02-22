##Mary Maccoun
##DSX Mutation Project 
## This file will manipulate data frame with data from ALL samples 
##creates a new data frame with rows = exon ID and column = sample name 
##file created 2/20/2019
##last updated 2/21/2019

library(tidyr)
library(data.table)

setwd("~/Desktop/dsx_project--master") #move all_M_data.csv and all_F_data.csv to directory to work in 

######## MAKE DATA FRAME CONTAINING ALL SAMPLE DATA #############
male <- read.csv('all_M_data.csv')
male$sex <- "M"

female <- read.csv('all_F_data.csv')
female$sex <- "F"

dat <- rbind(male, female)

dat$sample<- as.character(dat$sample)

dat$rep <- gsub(".*_", "", dat$sample)
dat$strain <- gsub("_.*", "", dat$sample)
names(dat) <- c( '', 'exonic region id', 'sample id', 'number of mapped reads', 'number of reads in the exonic region', 'coverage in exonic region (number of reads in exonic region / read length)', 'exonic region length','average per nucleotide coverage,','RPKM', 'sample','sex', 'rep', 'strain')
#write.csv(dat,'all_dat.csv')

###create a new column for the same of strain, rep, and sex 
dat$tmp <- paste(dat$sample,dat$sex)




# shapiro.test(log(dat$RPKM)) test to bellcurve 
# hist(dat$RPKM) #hist of RPKM data 
# hist(log(dat$RPKM)) #adj for bellc 
dat$logRPKM = log(dat$RPKM)

####EXON by SAMPLE data frame ######## 

exon_sample <- data.frame(dat[ ,2], dat[,15],dat[,14])   
new_exon = unique(exon_sample) #find root error in files later alligator 
ex_sam = dcast(new_exon, exon_id ~ sample_id ) 
ex_sam[ex_sam == -Inf] = NA #change -Inf to empty 

ex_pres = apply(ex_sam[,-1], 1, function(x) sum(!is.na(x))/22)  #checks each row of exons 
##throw out anything not a 1
##make a data frame with all the NA 
##take out anything not a 1 
pres_dat = data.frame(ex_pres)
hist(ex_pres)
final= ex_sam[ex_pres==1, ]
as.character(final$exon_id) -> final$exon_id   


#calc average for each sample RPMK value ... plot and look @ all the values 
#do boxplot 




dim(final)
write.csv(final,'exon_sample.csv') #normalization data look up 
##box plot 
##new column just strain, sex, strain, sex...see what affect of strain and sex 
