get_power_data <- function() {
    require(data.table)
    require(magrittr)
    require(lubridate)
    require(tidyr)
    
    ##Download file and save to table
    download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='power.zip')
    unzip('power.zip')
    power <- read.table('household_power_consumption.txt', header=TRUE, sep=';') %>% as.data.table
    
    ##Subset by date and convert to kilowatts
    power %<>% unite(Datetime, Date, Time, sep=' ')
    power$Datetime %<>% dmy_hms
    range <- interval(ymd(20070201), ymd_hms('20070202 23:59:59'))
    power <- power[power$Datetime %within% range,]
    
    ##Convert some columns to numeric, obviously can be written better but the different attempts were really annoying
    power$Global_active_power %<>% as.numeric %>% divide_by(1000)
    power$Global_reactive_power %<>% as.numeric
    power$Voltage %<>% as.numeric
    power$Sub_metering_1 %<>% as.numeric
    power$Sub_metering_2 %<>% as.numeric
    power$Sub_metering_3 %<>% as.numeric
    
    power
}