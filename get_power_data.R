get_power_data <- function() {
    require(data.table)
    require(magrittr)
    require(lubridate)
    require(tidyr)
    
    ##Download file and save to table
    download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='power.zip')
    unzip('power.zip')
    power <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
    
    ##Subset by date and convert to kilowatts
    power %<>% unite(Datetime, Date, Time, sep=' ')
    power$Datetime %<>% dmy_hms
    range <- interval(ymd(20070201), ymd_hms('20070202 23:59:59'))
    power <- power[power$Datetime %within% range,]
    power$Global_active_power %<>% as.numeric %>% divide_by(1000)
    
    power
}