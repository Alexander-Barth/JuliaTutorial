using Statistics
using BenchmarkTools

# Compute the running/moving correlation between a long
# time series x and a short time series y

x = sin.(1:100000)
y = sin.(1:24)

#=
# faster implementation

@inbounds function moving_correlation(x,y)
   lenx = length(x)
   leny = length(y)
   C = zeros(lenx-leny+1)

   for i in 1:(lenx-leny+1)
         C[i] = cor(view(x,i:(i+leny-1)),y)
   end
   return C
end
=#

function moving_correlation(x,y)
   lenx = length(x)
   leny = length(y)
   C = zeros(lenx-leny+1)

   for i in 1:(lenx-leny+1)
         C[i] = cor(x[i:(i+leny-1)],y)
   end
   return C
end

C = moving_correlation(x,y)

println("Test values")
println(C[1:3])

println("Julia $VERSION")
benchmark = @benchmark moving_correlation(x,y);
display(benchmark)

# median time:
# 8.446 ms
