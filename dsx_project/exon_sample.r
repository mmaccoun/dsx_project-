#file will make data frame with exon_ids found in ALL replicates 
setwd("/Users/maccom/Desktop/dsx_project--master") #move all_M_data.csv and all_F_data.csv to directory to work in 

male <- read.csv('all_M_data.csv')
male$sex <- "M"

female <- read.csv('all_F_data.csv')
female$sex <- "F"

dat <- rbind(male, female)

dat$sample<- as.character(dat$sample)

dat$rep <- gsub(".*_", "", dat$sample)
dat$strain <- gsub("_.*", "", dat$sample)


names(dat) <- c(' ', 'exonic region id', 'sample id', 'number of mapped reads', 'number of reads in the exonic region', 'coverage in exonic region (number of reads in exonic region / read length)', 'exonic region length','average per nucleotide coverage,','RPKM', 'sample','sex', 'rep', 'strain')
#write.csv(dat,'all_dat.csv')

# shapiro.test(log(dat$RPKM)) test to bellcurve 
# hist(dat$RPKM) #hist of RPKM data 
# hist(log(dat$RPKM)) #adj for bellc 
dat$logRPKM = log(dat$RPKM)



             
exon_sample <- data.frame(dat[ ,2], dat[,3])   
exon_sample <- cbind(exon_sample, dat[,14]) #c1 = exon_id, c2 = sample_id, c3 = logRPKM

names(exon_sample) <- c('exon_id', 'sample_id', 'logRPKM')
u <- unique(exon_sample[,1]) #search for unique exons 
datu <- data.frame(u) #data frame with unique exons...to be removed

d <- duplicated(exon_sample[,1])
dupd <- data.frame(d, dat[ ,2], dat [,3]) #bool value 1, true means exon duplicated in other samples...to be analyzed later   
names(dupd) <- c('exon_id_dups', 'sample_id', 'logRPKM') 

