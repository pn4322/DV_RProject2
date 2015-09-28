require(tidyr)
require(dplyr)
require(ggplot2)
setwd("~/Desktop/Data Visualization/DV_RProject2/01 Data")
file_path <- "NewYork.csv"

#df <- rename(NewYork, tbl = table)
df <- read.csv(file_path)
tbl_df(df)
View(df)

# select
df %>% select(Ethnicity, Year_) %>% tbl_df

# filter
df %>% select(Ethnicity, Sex) %>% filter(Sex == "FEMALE") %>% tbl_df 



df %>% group_by(Year_,Count_) %>% summarise(mean = mean(Count_))


