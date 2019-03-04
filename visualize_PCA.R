##Mary Maccoun
##DSX Mutation Project 
## This file will plot the PCA data from the samples 
##file created 3/4/2019
##last updated 3/4/2019

library(ggplot2)

setwd("~/Desktop/dsx_project--master")
data = read.csv("prcomp_data.csv", check.names = T)
#berX1 = data[ 1, 1:3]
sex = c("XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XX", "XY", "XY","XX", "XY", "XX", "XY", "XX", "XY")
cbind(data,sex)
strain = c("berlin", "berlin", "berlin", "berlin", "berlin", "berlin", "canton", "canton","canton","canton","canton","canton","canton","dsx", "dsx","dsx","dsx","dsx","dsx" )
cbind(data,strain)
print(data)

ggplot(data, aes(PC1,PC2)) + geom_point(aes(shape = group)) + geom_text(aes(label = data$X)) + stat_ellipse(aes(fill=strain))

#currently different plot points for XX and XY
#elipses grouped by strain 
##how to improve the plot--currently unclear 
