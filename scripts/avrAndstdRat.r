#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

firstFile = args[1]
numFiles = as.integer(args[2])
ratioFile = args[3]

numRatios = ncol(read.table(ratioFile))
rows = nrow(read.table(firstFile))
colm = ncol(read.table(firstFile))

ratios <- matrix(nrow=1,ncol=numRatios)
emptyVert <- matrix(nrow=numRatios,ncol=numFiles)
tumorOcc <- matrix(nrow=numRatios,ncol=numFiles)
healthOcc <- matrix(nrow=numRatios,ncol=numFiles)

fileName <- substr(firstFile,1, nchar(firstFile)-8)

ratios = read.table(ratioFile)

avrOcc <- matrix(nrow=numRatios,ncol=colm)
stdOcc <- matrix(nrow=numRatios,ncol=colm)

for( h in 1:numRatios){
  currFileRat = paste( fileName, ratios[,h], sep="")
  for (i in 1:numFiles) { 
    currFile = paste( currFileRat, "_", i, ".out", sep="") 
    emptyVert[h,i] = read.table(currFile)[rows,2] 
    tumorOcc[h,i] = read.table(currFile)[rows,3]
    healthOcc[h,i] = read.table(currFile)[rows,4]
  }
  avrOcc[h,1] = ratios[,h] / 10
  stdOcc[h,1] = ratios[,h] / 10
}

rows = nrow(emptyVert)

for (j in 1:rows){
  avrOcc[j,2] = mean(emptyVert[j,]) 
  avrOcc[j,3] = mean(tumorOcc[j,]) 
  avrOcc[j,4] = mean(healthOcc[j,])
  
  stdOcc[j,2] = sd(emptyVert[j,]) 
  stdOcc[j,3] = sd(tumorOcc[j,]) 
  stdOcc[j,4] = sd(healthOcc[j,])
}

finalMatrix <- cbind(avrOcc[,1:4],stdOcc[,3:4])
output <- paste(fileName,numFiles,"_statRatios.out",sep="");
  
write.table(format(finalMatrix, digits = 4, scientific = F, trim = T, drop0trailing = T), quote = F, file=output, row.names=F, col.names=F, sep = "\t")
