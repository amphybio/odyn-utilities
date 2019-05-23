#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

firstFile = args[1]
numFiles = as.integer(args[2])

rows = nrow(read.table(firstFile))-1
colm = ncol(read.table(firstFile))

emptyVert <- matrix(nrow=rows,ncol=numFiles)
tumorOcc <- matrix(nrow=rows,ncol=numFiles)
healthOcc <- matrix(nrow=rows,ncol=numFiles)

fileName <- substr(firstFile,1, nchar(firstFile)-5)

for (i in 1:numFiles) { 
  currFile = paste(fileName,i,".out",sep=""); 
  emptyVert[,i] = read.table(currFile)[-1,2] 
  tumorOcc[,i] = read.table(currFile)[-1,3]
  healthOcc[,i] = read.table(currFile)[-1,4]
}

rows = nrow(emptyVert)

avrOcc <- matrix(nrow=rows,ncol=colm)
stdOcc <- matrix(nrow=rows,ncol=colm)

avrOcc[,1] = read.table(currFile)[-1,1]
stdOcc[,1] = read.table(currFile)[-1,1]

for (j in 1:rows){
  avrOcc[j,2] = mean(emptyVert[j,]) 
  avrOcc[j,3] = mean(tumorOcc[j,]) 
  avrOcc[j,4] = mean(healthOcc[j,])
  
  stdOcc[j,2] = sd(emptyVert[j,]) 
  stdOcc[j,3] = sd(tumorOcc[j,]) 
  stdOcc[j,4] = sd(healthOcc[j,])
}

finalMatrix <- cbind(avrOcc[,1:4],stdOcc[,3:4])
output <- paste(fileName,numFiles,"_statOcc.out",sep="");
  
write.table(format(finalMatrix, digits = 4, scientific = F, trim = T, drop0trailing = T), quote = F, file=output, row.names=F, col.names=F, sep = "\t")