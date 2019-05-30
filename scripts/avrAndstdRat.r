#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

firstFile = args[1]
numFiles = as.integer(args[2])
ratioFile = args[3]

numRatios = ncol(read.table(ratioFile))
rows = nrow(read.table(firstFile))
colm = ncol(read.table(firstFile))

concatMatrix <- matrix(nrow=numRatios, ncol=colm)

fileName <- substr(firstFile,1, nchar(firstFile)-16)
numExec <- substr(firstFile, nchar(firstFile)-13, nchar(firstFile)) 

ratios = read.table(ratioFile)

for( h in 1:numRatios){
    currFile = paste( fileName, ratios[,h], numExec, sep="")
    concatMatrix[h,1] = ratios[,h] / 10
    for( i in 2:colm) {	
        concatMatrix[h,i] = read.table(currFile)[rows,i]
    }
}

output <- paste(fileName, numFiles,"_statRatios.out",sep="");
  
write.table(format(concatMatrix, digits = 4, scientific = F, trim = T, drop0trailing = T), quote = F, file=output, row.names=F, col.names=F, sep = "\t")
