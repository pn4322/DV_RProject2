require(tidyr)
require(dplyr)
require(ggplot2)
require(extrafont)

setwd("~/Desktop/Data Visualization/DV_RProject2/01 Data")
file_path <- "NewYork.csv"

#df <- rename(NewYork, tbl = table)
df <- read.csv(file_path)

#View(df)
tbl_df(df)

#Sex by count/number of deaths for each ethnicity in the year 2011.  Each dot represents a different cause of death.
#df %>% filter(Year_ == 2011) %>% select(Year_, Sex, Count_, Ethnicity) %>% group_by (Sex, Count_, Ethnicity) %>% View

#Views each ethnicity's percentage of death due to heart diseases for the years 2007 - 2011.  Each dot represents a different year's ethnicity's percent of death. Some years overlap with one another, which is why there aren't 5 full bullets per ethnicity. 
#df %>% filter(Sex == "MALE") %>% group_by (Percent_, Ethnicity, Cause,Year_)  %>% filter(Cause == "DISEASES OF HEART") %>% View


#Plots sex by count/number of deaths for each ethnicity in the year 2011.  Each dot represents a different cause of death.
df %>% filter(Year_ == 2011) %>% select(Year_, Sex, Count_, Ethnicity) %>% group_by (Sex, Count_, Ethnicity) %>% ggplot(aes(x=Sex, y=Count_)) + geom_point(aes(color=Ethnicity))

#Plots each ethnicity's percentage of death due to heart diseases for the years 2007 - 2011.  Each dot represents a different year's ethnicity's percent of death. Some years overlap with one another, which is why there aren't 5 full bullets per ethnicity. 
df %>% group_by (Percent_, Ethnicity, Cause,Year_) %>% filter(Sex == "MALE")  %>% filter(Cause == "DISEASES OF HEART") %>% ggplot(aes(x = Ethnicity, y = Percent_)) + geom_point(aes(color = Year_))

#Plots sex by count/number of deaths for each ethnicity in the year 2010.  Each dot represents a different cause of death.
df %>% group_by(Percent_, Ethnicity, Cause,Year_,Sex) %>% filter(Sex == "MALE") %>% filter(Ethnicity == "ASIAN & PACIFIC ISLANDER") %>%  ggplot(aes(x = Ethnicity, y = Percent_)) + geom_point(aes(color = Cause))

