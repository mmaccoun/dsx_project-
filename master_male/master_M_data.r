setwd("~/Desktop/mmaccoun/dsx_project--master/master_files/master_male") #change to correct working directory 

#import data from csv
f1 <- read.csv('GSM1220614_coverage_on_fusions_2011-05-03_1_ATCACG.csv', header=FALSE) #berlin1
f1$sample <- "berlin_1"

f2 <- read.csv('GSM1220615_coverage_on_fusions_2011-05-03_6_CGATGT.csv', header=FALSE) #berlin2
f2$sample <- "berlin_2"

f3 <- read.csv('GSM1220616_coverage_on_fusions_2011-05-03_5_TTAGGC.csv', header=FALSE) #berlin3
f3$sample <- "berlin_3"

f4 <- read.csv('GSM1220617_coverage_on_fusions_2011-05-03_1_ACTTGA.csv', header=FALSE) #canton1
f4$sample <- "canton_1"

f5 <- read.csv('GSM1220618_coverage_on_fusions_2011-05-03_2_ACTTGA.csv', header=FALSE) #canton2 
f5$sample <- "canton_2"

f6 <- read.csv('GSM1220619_coverage_on_fusions_2011-05-03_3_ACTTGA.csv', header=FALSE) #canton3
f6$sample <- "canton_3"

f7 <- read.csv('GSM1220620_coverage_on_fusions_2011-05-03_5_ACTTGA.csv', header=FALSE) #canton4
f7$sample <- "canton_4"

f8 <- read.csv('GSM1646280_coverage_on_fusions_2011-05-03_6_TTAGGC.csv', header=FALSE) #mutant1
f8$sample <- "mutant_1"

f9 <- read.csv('GSM1646281_coverage_on_fusions_2011-05-03_3_TGACCA.csv', header=FALSE) #mutant2
f9$sample <- "mutant_2"

f10 <- read.csv('GSM1646282_coverage_on_fusions_2011-05-03_6_ACAGTG.csv', header=FALSE) #mutant3
f10$sample <- "mutant_3"

#to concat all csv into a single data frame 
master_male <- rbind(f1,f2)
master_male <- rbind(master_male,f3)
master_male <- rbind(master_male,f4)
master_male <- rbind(master_male,f5)
master_male <- rbind(master_male,f6)
master_male <- rbind(master_male,f7)
master_male <- rbind(master_male,f8)
master_male <- rbind(master_male,f9)
master_male <- rbind(master_male,f10)

#data frame to csv 
write.csv(master_male, "all_M_data.csv") #has header, csv has merged all strains male data 
