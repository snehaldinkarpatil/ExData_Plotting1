getwd()
library(dplyr)
library(lubridate)
library(tidyr)
library(hms)
library(ggplot2)

## Reading the dataset
data <- read.table("/Users/vishalpatil/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", 
                   stringsAsFactors = FALSE)

## Changing the date column to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filtering the data
my_data <- data %>% filter(Date == "2007-02-01"| Date == "2007-02-02")

## Changing the time column to hms format
my_data$Time <- as_hms(my_data$Time)

## checking for missing values
my_data <- my_data[complete.cases(my_data),]

## Opening a png file
png("plot3.png", width = 480, height = 480)

## Creating Plot 3
plot(my_data$Sub_metering_1~my_data$datetime, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(my_data$Sub_metering_2~my_data$datetime, type = "l", col = "red")
lines(my_data$Sub_metering_3~my_data$datetime, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), 
       lty = c(1, 1, 1) )

## Close the file
dev.off()