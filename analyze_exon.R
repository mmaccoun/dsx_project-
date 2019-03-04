##Mary Maccoun
##DSX Mutation Project 
## This file analyze the logRPKM data through PCA 
##file created 2/28/2019
##last updated 3/4/2019

library(graphics)

#transpose data...exon in columns and sample name in rows 
##add colum for sex, strain, rep 

setwd("~/Desktop/dsx_project--master")
og = read.csv('exon_sample.csv')
data = og[2:21]


tdata <- data.frame(t(data)) #transpose data 
#need to separate name and rep # of data
mat = data.matrix(tdata,rownames.force = NA)


samplekey = data.frame(x_id = names(tdata), exon_id = og$exon_id) #to compare transposed column ID to true exon ID


prcomp_dat = prcomp (mat[-1,], retx = TRUE, center = TRUE, scale. = FALSE)

str(prcomp_dat)
prcomp_dat$x

class(prcomp_dat)
class(prcomp_dat$x)

tdata$tdata[,1] <- gsub(".*_", "", tdata$exon_id)
tdata$tdata[,1] <- gsub("..*", "", tdata$sex)
#print(tdata[1:5, 40188:40189 , 40188:40189])

geno_sex = gsub("_*.\\.", "_", row.names(tdata))[-1]
table(geno_sex)

#prcopmp contains PCs for all exons 

prcomp_dat$x
print(prcomp_dat$x)
write.csv(prcomp_dat$x, "prcomp_data.csv") #save pcomp data to CSV file 
