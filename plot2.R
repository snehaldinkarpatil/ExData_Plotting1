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
png("plot2.png", width = 480, height = 480)

## Creating Plot 2
my_data$datetime <- paste(my_data$Date, my_data$Time)
my_data$datetime <- strptime(my_data$datetime, format = "%Y-%m-%d %H:%M:%S")
my_data$datetime <- as.POSIXct(my_data$datetime)
my_data <- my_data %>% select(-Date, -Time)
plot(my_data$Global_active_power~my_data$datetime, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")


## Close the file
dev.off()

