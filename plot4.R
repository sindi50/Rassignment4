full_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
subdata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
G_a_p <- as.numeric(subdata$Global_active_power)
d_e_t <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)
G_r_p <- as.numeric(subdata$Global_reactive_power)
volt <- as.numeric(subdata$Voltage)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(d_e_t, G_a_p, xlab = "", ylab = "Global Active Power", col = "black", cex = 0.2, type = "l")

plot(d_e_t, volt, xlab = "datetime", ylab = "Voltage", col = "black", type = "l")

plot(d_e_t, sm1, xlab = " ", ylab = "Energy Submetering", type = "l")
lines(d_e_t, sm2, col = "red", type = "l")
lines(d_e_t, sm3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2.5, bty = "o")

plot(d_e_t, G_r_p, xlab = "", ylab = "Global_reactive_power", col = "black", type = "l")

dev.off()

