emissions <- NEI %>% 
    group_by(year) %>%
    filter(any(year == 1999 | year == 2002 | year == 2005 | year == 2008)) %>%
    summarise(total = sum(Emissions))

plot(emissions$year, emissions$total, col = "blue", xlab = "Year", ylab = "Total Emissions",
     main = "Levels of PM2.5 from 1999 to 2008", pch = 20, type = "o", xaxt = "n", yaxt = "n")
axis(1, at = emissions$year)
axis(2, at = emissions$total)


