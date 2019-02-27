#transpose data...exon in columns and sample name in rows 
##add colum for sex, strain, rep 

setwd("~/Desktop/dsx_project--master")
og = read.csv('exon_sample.csv')
data = og[, 2:24]

tdata <- data.frame(t(data)) #transpose data 
#need to separate name and rep # of data
print(tdata[,1])
an = tdata[(2:40189 ), ]
dim(an)


samplekey = data.frame(x_id = names(tdata), exon_id = og$exon_id) #to compare transposed column ID to true exon ID

sumstats = function(tdata){
  mean = apple(tdata, 2 ,mean)
  median = apply(tdata, 2 , median)
  sd = apply(tdata, 2, sd)
  result = data.frame(mean, median, sd)
  print(result)
  return(result) 
}

prcomp (analyze, retx = TRUE, center = TRUE, scale. = FALSE)

