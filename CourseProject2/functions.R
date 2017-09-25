### The point of this file is to not have to copy and paste the following 
### functions into each and every plot script. This way this file can just be 
### sourced into each script and the functions can be called when needed

## Read the data from summarySCC_PM25.rds and Source_Classification_Code.rds
## and store result in global environment
readData <- function() {
    if (!exists("NEI") & !exists("SCC")) {
        NEI <<- readRDS("data/summarySCC_PM25.rds")
        SCC <<- readRDS("data/Source_Classification_Code.rds")
    }
}

mergeTables <- function() {
    if (!exists("table_merged")) {
        table_merged <<- merge(NEI, SCC, by.y = as.character("SCC"), all.x = TRUE)
    }
}

## Launch the png graphics device.
## @param name The name of the file, i.e. plot1.png, plot2.png, etc.
launchGraphicsDevice <- function(name) {
    if (file.exists(name)) {
        stop("File already exists. Please delete and try again")
    }
    png(name, width = 480, height = 480)
}

## Closes the graphics device, saving the png file to the working directory
closeGraphicsDevice <- function() {
    dev.off()
}