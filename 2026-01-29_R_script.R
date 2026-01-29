# 2026-01-29
# JVS

vec = c(1, 0, 2, 1)
vec
vec[ c(T, F, T, F)]

3 == 3

a = 3
b = 3
a == b

x = 1
y = 3
x != y

x %in% vec
y %in% vec

c(1, 2, 3, 4) %in% c(3, 2, 1)

# world oceans data
world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Artic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))

world_oceans$ocean[world_oceans$avg_depth_m > 4000]

1 + 2 ==3
0.1 + 0.2 == 0.3
(0.1 + 0.2) - 0.3
error_threshold = 0.001
abs( 0.3- (0.1 + 0.2)) > error_threshold

x = 7
(x > 5) & (x < 10)

# and
x > 5 & x %in% c(1, 2, 3, 7)

# or
x > 5 | x %in% c(1, 2, 3)

vec1 = c(1,2,3)
vec2 = c(3,2,1)
vec1 == vec2

world_oceans[world_oceans$avg_depth_m > 4000 & world_oceans$area_km2 > 100e6]

vec2 = c(1, 2, NA, 4)
2 %in% vec2
x = NA
y = NA
x == y
is.na(x)
is.na(vec2)
sum(is.na(vec2))

# test if else statements

num = -2
if (num < 0){
  num = num *-1
  print("I made num positive")
}
num

num = 98
if (num > 98.6){
  num - 98.6
  print(num-98.6)
  if (num > 101){
    print("High Fever")
  }
} else{
  print("No Fever")
}

a = 200
b = 200

if (a > b){
  print("a wins")
} else if (b > a){
  print("b wins")
} else {
  print("it's a tie")
}
