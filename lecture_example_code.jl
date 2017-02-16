using DataArrays
using NetCDF
using PyPlot
using PyCall
@pyimport numpy.ma as ma

function datetick(axis,fmt = "%Y-%m-%d")
    ax = axes()
    formatter = matplotlib[:dates][:DateFormatter](fmt)

    if axis == :x
        ax[:xaxis][:set_major_formatter](formatter)
    else
        ax[:yaxis][:set_major_formatter](formatter)
    end
end

if false
sl  = readdlm("data/8762075.sealevel.txt",comment_char='%')
t = [DateTime(sl[i,1],sl[i,2],sl[i,3],sl[i,4],sl[i,5],0) for i = 1:size(sl,1)];
plot(t,sl[:,6],"g")

# http://julia-programming-language.2336112.n4.nabble.com/PyPlot-plot-date-How-do-I-alter-the-time-format-td8035.html

#xt,text = xticks()
#xticks(xt[1:2:end])

ax = axes()
formatter = matplotlib[:dates][:DateFormatter]("%Y-%m")
locator = matplotlib[:dates][:MonthLocator](interval=2)
ax[:xaxis][:set_major_locator](locator)
ax[:xaxis][:set_major_formatter](formatter)
end

if true
    fname = "data/WesternMedSST.nc";
    lon = ncread(fname,"lon");
    lat = ncread(fname,"lat");
    time = ncread(fname,"time");
    tmp = ncread(fname,"seviri_sst");
    SST = DataArray(tmp,tmp .== -9999.);
    mask = ncread(fname,"mask");
end

pyma(S) =  pycall(ma.array, Any, S.data, mask=S.na)
PyPlot.pcolor(x,y,z::DataArray; kws...) = pcolor(x,y,pyma(z); kws...)
PyPlot.pcolor(z::DataArray; kws...) = pcolor(pyma(z); kws...)

clf()
pcolor(lon,lat,SST[:,:,1]');
colorbar()

savefig("SST_first.png")

clf()
count = 100 * squeeze(sum(!SST.na,3),3) / size(SST,3);
pcolor(lon,lat,count'), colorbar()
savefig("Fig/SST_count.png")


clf()
count = squeeze(sum(sum(!SST.na,1),2),(1,2))
percentage = 100 * count / sum(mask[:]);

dt = [DateTime(1900,1,1) + Dates.Second(round(Int64,24*60*60*_)) for _ in time]

plot(dt,percentage)
datetick(:x,"%m-%d")

#ax = axes()
#formatter = matplotlib[:dates][:DateFormatter]("%Y-%m-%d")
#ax[:xaxis][:set_major_formatter](formatter)

savefig("Fig/SST_count_time.png")

clf()
SST2 = copy(SST.data);
SST2[SST.na] = 0;
count = sum(!SST.na,3)
meanSST = DataArray(sum(SST2,3) ./ count,count .== 0);


pcolor(lon,lat,meanSST[:,:,1]');   colorbar()
savefig("Fig/SST_time_mean.png")

clf()
meanSSTt = sum(sum(SST2,1),2) ./ sum(sum(!SST.na,1),2);
meanSSTt = squeeze(meanSSTt,(1,2));
plot(dt,meanSSTt)
datetick(:x,"%m-%d")
savefig("Fig/SST_space_mean.png")

clf()
meanSSTt2 = mean(mean(SST,1,skipna=true),2,skipna=true)
meanSSTt2 = squeeze(meanSSTt2,(1,2));
plot(dt,meanSSTt,"b")
plot(dt,meanSSTt2,"r")
legend(["result with sum","result with nanmean"]);
datetick(:x,"%m-%d")
savefig("Fig/SST_space_mean2.png")


clf()
count = sum(sum(SST .> 25,1,skipna = true),2,skipna = true);
count = squeeze(count,(1,2))
plot(dt,count)
datetick(:x,"%m-%d")
savefig("Fig/SST_count25.png")


clf()
# Earth Radius (in km)
R = 6371;
# surface of each cell
dx = pi * 0.05 * R/180;
dy = pi * 0.05 * R/180 * cos(pi*lat/180);

#dS = dx*dy;
#dS2 = reshape(dS,(1,217,1));
#dS3 = repeat(dS2,inner=(327,1,384));
#dS3(SST <= 25 | isna(SST)) = 0;

dS = zeros(size(SST));
for k = 1:size(SST,3)
    for j = 1:size(SST,2)
        for i = 1:size(SST,1)
            if !isna(SST[i,j,k]) && SST[i,j,k] > 25
                dS[i,j,k] = dx * dy[j]
            end
        end
    end
end

area = squeeze(sum(sum(dS,1),2),(1,2));
plot(dt,area)
datetick(:x,"%m-%d")
savefig("Fig/SST_area25.png")