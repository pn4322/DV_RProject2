require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from NewYork"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pn4322', PASS='orcl_pn4322', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_discrete() +
  #facet_wrap(~ETHNICITY) +
  #facet_grid(.~ETHNICITY, labeller=label_both) + # Same as facet_wrap but with a label.
  facet_grid(ETHNICITY~YEAR_, labeller=label_both) +
  labs(title='NewYork') +
  labs(x="Year", y=paste("Ethnicity")) +
  layer(data=df, 
        mapping=aes(x=as.numeric(as.character(YEAR_)), y=(as.character(ETHNICITY)), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="jitter",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.7, height=0.7)
  )


require("jsonlite")
require("RCurl")
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from NewYork where sex is FEMALE"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pn4322', PASS='orcl_pn4322', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)


require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_discrete() +
  #facet_wrap(~ETHNICITY) +
  #facet_grid(.~ETHNICITY, labeller=label_both) + # Same as facet_wrap but with a label.
  facet_grid(ETHNICITY~YEAR_, labeller=label_both) +
  labs(title='NewYork') +
  labs(x="Year", y=paste("Ethnicity")) +
  layer(data=df, 
        mapping=aes(x=(as.character(SEX)), y=(as.character(CAUSE)), color=ETHNICITY), 
        stat="identity", 
        stat_params=list(), 
        geom="jitter",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.7, height=0.7)
  )