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
png("plot1.png", width = 480, height = 480)

## Creating Plot 1
my_data$Global_active_power <- as.numeric(my_data$Global_active_power)
hist(my_data$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

## Close the file
dev.off()