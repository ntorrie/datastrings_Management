# June 1, 2020

# I recommend saving a separate script for each area in the _FINAL folder

# arguments are described in the help file for each function
# **Make sure to change the serial numbers and depths for HOBO 
# and change the depth for aquaMeasure

# load packages
library(strings)
library(dplyr)

# Define arguments --------------------------------------------------------

# name of of folder (area and deployment date)
# --> change this!!
main_folder <- "Shad Bay 2018-11-15_FINAL"

# name  of area and range of deployment
# --> change these!
area = "Shad Bay"
deployment <- "2018-Nov-15 to 2020-Jan24"

# path to main file
# --> change this to the directory you are working from
path <-  file.path(paste("C:/Users/Danielle Dempsey/Desktop/RProjects/datastrings_Management/data/", 
                         main_folder, sep = ""))

# path to HOBO data
path.HOBO <- paste(path, "/Hobo/", sep = "")

# path to aquaMeasure data
path.aM <- paste(path, "/aquaMeasure/", sep = "")


# arguments for HOBO function
# --> update this from the log file
serial_vardepth_table <- data.frame(SERIAL = c("HOBO-20291439",
                                               "HOBO-10755206",
                                               "HOBO-20291467"),
                                    VAR_DEPTH = c("Temperature-2m",
                                                  "Temperature-10m",
                                                  "Temperature-15m"))

# arguments for aM function
# --> update this from the log file
depth.aM <- "5m"
vars.aM = c("Temperature", "Dissolved Oxygen") 


# Extract Data ------------------------------------------------------------

# hobo data will be exported to path/Hobo
compile_HOBO_data(path.HOBO = path.HOBO,
                          area.name = area,
                          serial.table = serial_vardepth_table,
                          deployment.range = deployment)

# aquaMeasure data will be exported to path/aquaMeasure
compile_aquaMeasure_data(path.aM = path.aM,
                               area.name = area,
                               vars.aM = vars.aM,
                               depth.aM = depth.aM,
                               deployment.range = deployment)

