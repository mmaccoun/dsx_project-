setwd("~/Desktop/mmaccoun/dsx_project--master/master_files/master_female") #change to correct working directory 

#import data from csv
f1 <- read.csv('GSM1220611_coverage_on_fusions_2011-05-03_5_TGACCA.csv', header=FALSE) #berlin1
f1$sample <- "berlin_1"

f2 <- read.csv('GSM1220612_coverage_on_fusions_2011-05-03_3_ACAGTG.csv', header=FALSE) #berlin2
f2$sample <- "berlin_2"

f3 <- read.csv('GSM1220612_coverage_on_fusions_2011-05-03_3_ACAGTG.csv', header=FALSE) #berlin3
f3$sample <- "berlin_3"

f4 <- read.csv('GSM1220647_coverage_on_fusions_2011-07-05_7_CAGATC.csv', header=FALSE) #canton1
f4$sample <- "canton_1"

f5 <- read.csv('GSM1220648_coverage_on_fusions_2011-07-05_7_ACTTGA.csv', header=FALSE) #canton2 
f5$sample <- "canton_2"

f6 <- read.csv('GSM1220649_coverage_on_fusions_2011-07-05_8_GATCAG.csv', header=FALSE) #canton3
f6$sample <- "canton_3"

f7 <- read.csv('GSM1646274_coverage_on_fusions_2011-05-03_1_CAGATC.csv', header=FALSE) #mutant1
f7$sample <- "mutant_1"

f8 <- read.csv('GSM1646275_coverage_on_fusions_2011-05-03_6_ACTTGA.csv', header=FALSE) #mutant2
f8$sample <- "mutant_2"

f9 <- read.csv('GSM1646276_coverage_on_fusions_2011-05-03_5_GATCAG.csv', header=FALSE) #mutant3
f9$sample <- "mutant_3"

f10 <- read.csv('GSM1646277_coverage_on_fusions_2011-05-03_6_TAGCTT.csv', header=FALSE) #mutant4
f10$sample <- "mutant_4"

f11 <- read.csv('GSM1646278_coverage_on_fusions_2011-05-03_2_ATCACG.csv', header=FALSE) #mutant5
f11$sample <- "mutant_5"

f12 <- read.csv('GSM1646279_coverage_on_fusions_2011-05-03_5_CGATGT.csv', header=FALSE) #mutant6
f12$sample <- "mutant_6"

#to concat all csv into a single data frame 
master_female <- rbind(f1,f2)
master_female <- rbind(master_female,f3)
master_female <- rbind(master_female,f4)
master_female <- rbind(master_female,f5)
master_female <- rbind(master_female,f6)
master_female <- rbind(master_female,f7)
master_female <- rbind(master_female,f8)
master_female <- rbind(master_female,f9)
master_female <- rbind(master_female,f10)
master_female <- rbind(master_female,f11)
master_female <- rbind(master_female,f12)

#data frame to csv
write.csv(master_female, "all_F_data.csv" ) #has header, csv has merged all strains female data 
