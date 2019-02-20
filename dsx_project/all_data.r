setwd("~/Desktop/mmaccoun/dsx_project--master/master_files") #move all_M_data.csv and all_F_data.csv to directory to work in 

male <- read.csv('all_M_data.csv')
male$sex <- "M"

female <- read.csv('all_F_data.csv')
female$sex <- "F"

dat <- rbind(male, female)

dat$sample<- as.character(dat$sample)

dat$rep <- gsub(".*_", "", dat$sample)
dat$strain <- gsub("_.*", "", dat$sample)
str(dat)

names(dat) <- c(' ', 'exonic region id', 'sample id', 'number of mapped reads', 'number of reads in the exonic region', 'coverage in exonic region (number of reads in exonic region / read length)', 'exonic region length','average per nucleotide coverage,','RPKM', 'sample','sex', 'rep', 'strain')
#write.csv(dat,'all_dat.csv')

hist(dat$RPKM) #hist of RPKM data 
# hist(log(dat$RPKM)) #adj for bellc 
dat$logRPKM = log(dat$RPKM)

# shapiro.test(log(dat$RPKM)) test to bellcurve 

             