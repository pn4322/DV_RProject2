require(tidyr)
require(dplyr)
require(ggplot2)

NewYork <- "NewYork.csv"

#df <- rename(NewYork, tbl = table)
df <- read.csv(file_path)
tbl_df(df)
View(df)

# select
df %>% select(ETHNICITY, YEAR_) %>% tbl_df

# filter
df %>% select(SEX, CAUSE) %>% filter(SEX == "FEMALE") %>% tbl_df 



df %>% group_by(YEAR_,COUNT_) %>% summarise(mean = mean(COUNT_))


