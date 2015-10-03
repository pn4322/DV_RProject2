require(tidyr)
require(dplyr)
require(ggplot2)
require(extrafont)
require("jsonlite")
require("RCurl")

# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from NEWYORK"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pn4322', PASS='orcl_pn4322', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

#View(df)
tbl_df(df)

#Sex by count/number of deaths for each ethnicity in the year 2011.  Each dot represents a different cause of death.
#df %>% filter(Year_ == 2011) %>% select(Year_, Sex, Count_, Ethnicity) %>% group_by (Sex, Count_, Ethnicity) %>% View

#Views each ethnicity's percentage of death due to heart diseases for the years 2007 - 2011.  Each dot represents a different year's ethnicity's percent of death. Some years overlap with one another, which is why there aren't 5 full bullets per ethnicity. 
#df %>% filter(Sex == "MALE") %>% group_by (Percent_, Ethnicity, Cause,Year_)  %>% filter(Cause == "DISEASES OF HEART") %>% View


#Plots sex by count/number of deaths for each ethnicity in the year 2011.  Each dot represents a different cause of death.
df %>% filter(YEAR_ == 2011) %>% select(YEAR_, SEX, COUNT_, ETHNICITY) %>% group_by (SEX, COUNT_, ETHNICITY) %>% ggplot(aes(x=SEX, y=COUNT_)) + geom_point(aes(color=ETHNICITY))

#Plots each ethnicity's percentage of death due to heart diseases for the years 2007 - 2011.  Each dot represents a different year's ethnicity's percent of death. Some years overlap with one another, which is why there aren't 5 full bullets per ethnicity. 
df %>% group_by (PERCENT_, ETHNICITY, CAUSE,YEAR_) %>% filter(SEX == "MALE")  %>% filter(CAUSE == "DISEASES OF HEART") %>% ggplot(aes(x = ETHNICITY, y = PERCENT_)) + geom_point(aes(color = YEAR_))

#For the third plot: Plots the percent of deaths of both Asian & Pacific Islander males and females per specific disease from 2007 - 2011.
df %>% group_by(PERCENT_, ETHNICITY, CAUSE,YEAR_,SEX) %>% filter(ETHNICITY == "ASIAN & PACIFIC ISLANDER") %>%  ggplot(aes(x = SEX, y = PERCENT_)) + geom_point(aes(color = CAUSE))

summary(df)
head(df)



