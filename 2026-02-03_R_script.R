# 2026-02-03
# JVS

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'

co2 = read.table(file = url, col.names = c("year", 
                                            "month", 
                                            "decimal_date", 
                                            "monthly_average", 
                                            "deseasonalized", 
                                            "n_days", 
                                            "st_dev_days", 
                                            "monthly_mean_uncertainty"))

# plot it

plot(monthly_average ~ decimal_date, data = co2, type = "l")
lines(deseasonalized ~ decimal_date, data = co2, col = "red")

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)

plot(seasonal_cycle ~ decimal_date, data = co2, type = "l")

# grab most recent 5 years and plot
co2_2021to2026 = co2[co2$decimal_date > 2021, ]
summary(co2_2021to2026)

plot(seasonal_cycle ~ decimal_date, data = co2_2021to2026, type = "l")

jan_anomalies = co2$seasonal_cycle[co2$month == 1]

jan_anomalies = mean(co2$seasonal_cycle[co2$month == 1])

# create data frame w/ monthly detrended co2 anomalies
co2_monthly_cycle = data.frame(month = seq(12), detrended_monthly_cycle = NA)

# fill in data
co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2$seasonal_cycle[co2$month == 1])
co2_monthly_cycle$detrended_monthly_cycle[2] = mean(co2$seasonal_cycle[co2$month == 2])
co2_monthly_cycle$detrended_monthly_cycle[3] = mean(co2$seasonal_cycle[co2$month == 3])
co2_monthly_cycle$detrended_monthly_cycle[4] = mean(co2$seasonal_cycle[co2$month == 4])
co2_monthly_cycle$detrended_monthly_cycle[5] = mean(co2$seasonal_cycle[co2$month == 5])
co2_monthly_cycle$detrended_monthly_cycle[6] = mean(co2$seasonal_cycle[co2$month == 6])
co2_monthly_cycle$detrended_monthly_cycle[7] = mean(co2$seasonal_cycle[co2$month == 7])
co2_monthly_cycle$detrended_monthly_cycle[8] = mean(co2$seasonal_cycle[co2$month == 8])
co2_monthly_cycle$detrended_monthly_cycle[9] = mean(co2$seasonal_cycle[co2$month == 9])
co2_monthly_cycle$detrended_monthly_cycle[10] = mean(co2$seasonal_cycle[co2$month == 10])
co2_monthly_cycle$detrended_monthly_cycle[11] = mean(co2$seasonal_cycle[co2$month == 11])
co2_monthly_cycle$detrended_monthly_cycle[12] = mean(co2$seasonal_cycle[co2$month == 12])
co2_monthly_cycle

plot(detrended_monthly_cycle ~ month, data = co2_monthly_cycle, type = "l", col = "navyblue")


# loops
for (i in c(1:4)){
    print(i)
}

sentence = c("loops", "are", "fun", "y'all")
for (word in sentence){
  print (word)
}

my_vector = c(1, 3, 5, 2, 4)
n_my_vector = length(my_vector)
my_vector_squared = rep(NA, n_my_vector)

for (i in seq(n_my_vector)){
  print( paste("I'm on iteration: ", i))
  my_vector_squared[i] = my_vector[i]^2
  print(paste("my answer is: ", my_vector_squared[i]))
}
my_vector_squared


# calculate total of a vector
my_vector = c(1, 3, 5, 2, 4)
n_my_vector = length(my_vector)
my_vector_total = 0
for (i in seq(n_my_vector)){
  print(paste("before the calc: ", my_vector_total))
  my_vector_total = my_vector_total + my_vector[i]
  print(paste("after the calc: ", my_vector_total))
}

# calculate factorials (!) w/ for loop
num = 5
factorial_result = 1
for (i in seq(num)){
  factorial_result = i * factorial_result
  print(factorial_result)
}

