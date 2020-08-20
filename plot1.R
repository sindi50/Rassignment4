full_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
ubdata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
G_a_p <- as.numeric(subdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(G_a_p, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

