#transpose data...exon in columns and sample name in rows 
##add colum for sex, strain, rep 

setwd("~/Desktop/dsx_project--master")
og = read.csv('exon_sample.csv')
data = og[, 2:24]

tdata <- data.frame(t(data)) #transpose data 
#need to separate name and rep # of data
mat = data.matrix(tdata,rownames.force = NA)


samplekey = data.frame(x_id = names(tdata), exon_id = og$exon_id) #to compare transposed column ID to true exon ID

sumstats = function(tdata){
  mean = apple(tdata, 2 ,mean)
  median = apply(tdata, 2 , median)
  sd = apply(tdata, 2, sd)
  result = data.frame(mean, median, sd)
  print(result)
  return(result) 
}

prcomp_dat = prcomp (mat[-1,], retx = TRUE, center = TRUE, scale. = FALSE)

str(prcomp_dat)
prcomp_dat$x

class(prcomp_dat)
class(prcomp_dat$x)

tdata$tdata[,1] <- gsub(".*_", "", tdata$exon_id)
tdata$tdata[,1] <- gsub("..*", "", tdata$sex)
print(tdata[1:5, 40188:40189 , 40188:40189])

geno_sex = gsub("_*.\\.", "_", row.names(tdata))[-1]
table(geno_sex)

prcomp_dat$x

##produce visual model of data 
plot(prcomp_dat$x[,1], prcomp_dat$x[,2], col = as.factor(geno_sex), pch = 19,
     xlab = "PC1 (18% var. expl.)", ylab = "PC2 (14% var.xx expl.)",
     main = "PCA of transcriptome of control/dsx mutants")
legend("bottomright", levels(as.factor(geno_sex)), col = c(1:6), pch = 19, cex = 0.75)

pairs(prcomp_dat$x[,1:5], col = as.factor(geno_sex), pch = 19)
