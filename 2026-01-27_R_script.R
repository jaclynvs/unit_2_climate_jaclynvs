# 2026-01-27
# class script

# read in data

ant_ice_loss = read.table(file = "data/antarctica_mass_200204_202505.txt",
                          skip = 31,
                          header = F,
                          col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
ant_ice_loss

grn_ice_loss = read.table(file = "data/greenland_mass_200204_202505.txt",
                          skip = 31,
                          header = F,
                          col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
head(grn_ice_loss)

dim(grn_ice_loss)
dim(ant_ice_loss)
summary(grn_ice_loss)
summary(ant_ice_loss)

# plot data 
# 2 plots
plot(x = ant_ice_loss$decimal_date, y = ant_ice_loss$mass_Gt,
    type = "l",
    xlab = "",
    ylab = "Antartic mass loss (Gt)")

plot(mass_Gt ~ decimal_date,
    data = grn_ice_loss,
    type = "l",
    xlab = "",
    col = "red",
    ylab = "Greenland mass loss (Gt)")

# both data on 1 plot
range(grn_ice_loss$mass_Gt)

plot(x = ant_ice_loss$decimal_date, y = ant_ice_loss$mass_Gt,
    ylim = range(grn_ice_loss$mass_Gt),
    type = "l",
    xlab = "",
    ylab = "Ice mass loss (Gt)")

lines(mass_Gt ~ decimal_date,
    data = grn_ice_loss,
    type = "l",
    xlab = "",
    col = "red")

# add a break between grace missions (2018)
data_break = data.frame(decimal_date = 2018,
                        mass_Gt = NA,
                        sigma_Gt = NA)
data_break
ant_ice_loss_NA = rbind(ant_ice_loss, data_break)
head(ant_ice_loss_NA)
tail(ant_ice_loss_NA)

ant_ice_loss_NA$decimal_date
order(ant_ice_loss_NA$decimal_date)

ant_ice_loss_NA = ant_ice_loss_NA[order(ant_ice_loss_NA$decimal_date),]
tail(ant_ice_loss_NA)

# do it for greenland
grn_ice_loss_NA = rbind(grn_ice_loss, data_break)
grn_ice_loss_NA = grn_ice_loss_NA[order(grn_ice_loss_NA$decimal_date),]


plot(x = ant_ice_loss_NA$decimal_date, y = ant_ice_loss_NA$mass_Gt,
    ylim = range(ant_ice_loss$mass_Gt),
    type = "l",
    xlab = "",
    ylab = "Ice mass loss (Gt)")
lines(((sigma_Gt * 2) + mass_Gt) ~ decimal_date,
      data = ant_ice_loss_NA,
      lty = "dashed")
lines((mass_Gt - sigma_Gt*2) ~ decimal_date,
      data = ant_ice_loss_NA,
      lty = "dashed")
lines(mass_Gt ~ decimal_date,
    data = grn_ice_loss,
    type = "l",
    xlab = "",
    col = "red")

min(ant_ice_loss$mass_Gt)
min(grn_ice_loss$mass_Gt)

# open up a plotting device
pdf("figures/ice_mass_trends.pdf", width = 7, height = 5)

barplot(height = c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt))*(-1),
        names.arg = c("Antactica", "Greenland"))

# close the plotting window
dev.off()