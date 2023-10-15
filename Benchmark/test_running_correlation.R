library(microbenchmark)

# Compute the running/moving correlation between a long
# time series x and a short time series y

x <- sin(1:100000)
y <- sin(1:24)


moving_correlation <- function(x,y) {
   lenx = length(x)
   leny = length(y)
   C <- numeric(lenx-leny+1)
   
   for (i in 1:(lenx-leny+1)) {
         C[i] <- cor(x[i:(i+leny-1)],y)
   }
   return(C)
}


C = moving_correlation(x,y)
print("Test values")
print(C[1:3])

mbm <- microbenchmark("mc" = moving_correlation(x,y),times=30)

print(R.version.string)
print(mbm)

# Unit: seconds
# expr      min      lq     mean   median       uq      max neval
#   mc 1.352147 1.35971 1.368118 1.365405 1.375247 1.394279    30
