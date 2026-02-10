# 2026-02-10
# JVS

x = c(1, 2, 3, 4)
mean(x)

avg = function(x){
  s = sum(x)
  n = length(x)
  answer = s/n 
  return(answer)
}

avg(seq(from = 3, to = 500))

# this will calc the arithmetic mean by default
# otherwise it calcs the geometric mean

avg = function(x, arithmetic = T){
  if (!is.numeric(x)){
    stop("Error: x isn't numeric")
  }

  if(arithmetic){
    result = sum(x) / length(x)
  } else if (arithmetic == F){
    result = prod(x)^(1/length(x))
  } else {
    print("unclear if you wanted an arithmetic mean")
  }
  return(result)
}
avg("hi")

avg(x)
avg(x, arithmetic = F)
avg(arithmetic = F, x = seq(from = 5, to = 13))
avg(x, T)

# NASA global temp index
url = "https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt"
temp_anomaly = read.delim(file = url, skip = 5, sep = "", header = F, 
                          col.names = c("Year", "No_Smoothing", "Lowess_5"))
head(temp_anomaly)
tail(temp_anomaly)
summary(temp_anomaly)

temp_1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year==1998]
temp_2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year==2012]

plot(No_Smoothing ~ Year, data = temp_anomaly, ylab = "Global Temp Anomaly *C")
lines(No_Smoothing ~ Year, data = temp_anomaly)
lines(Lowess_5 ~ Year, data = temp_anomaly, col = "red")
abline(v = 1998, lty = "dashed")
abline(v = 2012, lty = "dashed")
lines(x = c(1998, 2012), y = c(temp_1998, temp_2012), col = "blue", lwd = 3)

# make a user defined func to calc a rolling avg
data = seq(1,20)
calc_rolling_avg = function(data, moving_window = 5){
  result = rep(NA, length(data))
  for (i in seq(from = moving_window, to = length(result))){ # skip elements preceding the length of moving window
    result[i] = mean(data[seq(from = (i - moving_window + 1), to = i)])
  }
  return(result)
}

head(temp_anomaly)
temp_anomaly$avg_5_yr = calc_rolling_avg(temp_anomaly$No_Smoothing)
temp_anomaly$avg_10_yr = calc_rolling_avg(temp_anomaly$No_Smoothing, moving_window = 10)
head(temp_anomaly)

plot(No_Smoothing ~ Year, data = temp_anomaly, type = "l")
lines(avg_5_yr ~ Year, data = temp_anomaly, col = "red")
lines(avg_10_yr ~ Year, data = temp_anomaly, col = "green")

# top of my ice core script
source("my_functions.r")

# Exercise 7.1
calc_grade_letter = function(grade_percent){
  
}