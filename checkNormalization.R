##Mary Maccoun
##DSX Mutation Project 
## This file will make a box plot to check for RPKM normalization among ALL samples 
##boxplot x axis = sample name, y axis = distribution of RPKM data 
##file created 2/25/2019
##last updated 2/25/2019

setwd("~/Desktop/dsx_project--master")
library(graphics)
dat = read.csv('exon_sample.csv')
boxplot(dat[3:24]) #see all samples exon RPKM spread

##looks normal 