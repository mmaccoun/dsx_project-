##Mary Maccoun
##DSX Mutation Project 
## This file will plot the PCA data from the samples 
##file created 3/4/2019
##last updated 3/5/2019

library(ggplot2)

setwd("~/Desktop/dsx_project--master")
data = read.csv("prcomp_data.csv", check.names = T)
#berX1 = data[ 1, 1:3]
sex = c("XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XY","XX", "XY", "XX", "XY", "XX", "XY")
cbind(data,sex)
strain = c("berlin", "berlin", "berlin", "berlin", "berlin", "berlin", "canton", "canton","canton","canton","canton","canton","canton","dsx", "dsx","dsx","dsx","dsx","dsx" )
cbind(data,strain)
cbind(data,rep)
print(data)

ggplot(data, aes(PC1, PC2, color = strain, fill = strain)) + geom_point(aes(shape = sex)) + scale_shape_manual(values = c(10,3))+ stat_ellipse(type = "norm", geom = "polygon", alpha = 0.35, level = 0.5,aes(fill = strain)) + labs(x = "PC1 (20.2% var. explained)", y = "PC2 (15.2% var. explained)")



