

# Benchmark

Compute the running/moving correlation between a long
time series x and a short time series y


This benchmark compare a straight-foward implementations
using loops in [julia](test_running_correlation.jl) and [R](test_running_correlation.R).

|        |        |   median  |  mean  |
|--------|--------|-----------|--------|
| julia  | 1.9.0  | 8.446 ms  |  8.403 ms  |
| R      | 4.1.2  | 1383 ms   |  1376 ms |


Results from on Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz

In R, one need to "vectorize" code (i.e. avoid loops in the R code) to achieve good performance which is not always possible.
