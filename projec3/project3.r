##Ans1
library(dplyr)
library(tidyverse)
library(magrittr)
table2
a <- spread(table2,key=type,value=count)
# Extract the number of TB cases per country per year
m <-  select(a,country, year, cases)
m
#Extract the matching population per country per year
n <- select(a,country, year, population)
n
#Divide cases by population, and multiply by 10,000
rate <- m%>%mutate(population= n$population, casesperpop = (cases / population) * 10000)
o <- select (rate, country, year, casesperpop)
o
#Storing it in appropriate place
store <- o%>%mutate(cases= m$cases, population= n$population)
final_store <- gather(store, type, count, casesperpop, cases, population)
final_store

table4a
table4b

# Extract the number of TB cases per country per year
m1 <- table4a%>%gather(key="year",value="cases", `1999`,`2000`)
m1
#Extract the matching population per country per year
n1 <- table4b%>%gather(key="year",value="population", `1999`,`2000`)
n1
#Divide cases by population, and multiply by 10,000
rate1 <- m1%>%mutate(population= n1$population, casesperpop1 = (cases / population) * 10000)
rate1
o1 <- select (rate1, country, year, casesperpop1)
o1
#Storing it in appropriate place
store1 <- o1%>%mutate(cases= m1$cases, population= n1$population)
final_store1 <- gather(store1, type, count, casesperpop1, cases, population)

##Ans2
##table4a%>%gather(1999,2000,key="year",value="cases")
table4a%>%gather(key="year",value="cases", `1999`,`2000`)


##Ans3
library(nycflights13)
library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyverse)
library(lubridate)
datetime_df <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_df <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(
    dep_time = datetime_df(year, month, day, dep_time),
    arr_time = datetime_df(year, month, day, arr_time),
    sched_dep_time = datetime_df(year, month, day, sched_dep_time),
    sched_arr_time = datetime_df(year, month, day, sched_arr_time)
  ) %>%
  
select(flight, origin, dest, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, air_time)

flights_df

flights_df %>%
  mutate(time_of_flight = hour(arr_time) * 100 + minute(arr_time),
         m_df = as.factor(month
                          (arr_time))) %>%
  ggplot(aes(x = time_of_flight, group = m_df, color = m_df)) +
  geom_freqpoly(binwidth = 200)
  flights_df %>%
  mutate(time_of_flight = hour(dep_time) * 100 + minute(dep_time),
         m_df = as.factor(month
                          (dep_time))) %>%
  ggplot(aes(x = time_of_flight, group = m_df, color = m_df)) +
  geom_freqpoly(binwidth = 200)


flights_df %>%
  mutate(time_of_flight = hour(sched_arr_time) * 100 + minute(sched_arr_time),
         m_df = as.factor(month
                          (sched_arr_time))) %>%
  ggplot(aes(x = time_of_flight, group = m_df, color = m_df)) +
  geom_freqpoly(binwidth = 200)

flights_df %>%
  mutate(time_of_flight = hour(sched_dep_time) * 100 + minute(sched_dep_time),
         m_df = as.factor(month
                          (sched_dep_time))) %>%
  ggplot(aes(x = time_of_flight, group = m_df, color = m_df)) +
  geom_freqpoly(binwidth = 200)
 k <- flights_df %>%
  mutate(calculated_delay = (dep_time - sched_dep_time) / 60 , diff = as.numeric(calculated_delay - dep_delay)) %>%
  select(dep_time, sched_dep_time, dep_delay, calculated_delay, diff)
k

k_filter <- flights_df %>%
  mutate(calculated_delay = (dep_time - sched_dep_time) / 60 , diff = as.numeric(calculated_delay - dep_delay)) %>%
  filter(calculated_delay != dep_delay) %>%
  select(dep_time, sched_dep_time, dep_delay, calculated_delay, diff)
k_filter

flights_df %>%
  mutate(calculated_delay = (dep_time - sched_dep_time) / 60, diff = as.numeric(calculated_delay - dep_delay)) %>%
  ggplot(aes(diff)) +
  geom_bar() +
  coord_cartesian(xlim = c(-5000,5000))
  
  flights_df %>%
  mutate(early_departures = dep_delay < 0,
         #early_departures = dep_delay < 0 this will give departures in negative integers which will indicate the early departure flights
         time_in_minutes = minute(sched_dep_time)) %>%
         # we are converting sched_dep_time into minutes so that we can compare it for 20-30 mins and 50-60 mins
  group_by(time_in_minutes) %>%
  summarise(early_departures = mean(early_departures)) %>%
  ggplot(aes(x = time_in_minutes, y = early_departures)) +geom_line()
library(rvest)

#Reading webpage
scraping_geiselmed_qbs <-  read_html("https://geiselmed.dartmouth.edu/qbs/")

head(scraping_geiselmed_qbs)

h1_text <- scraping_geiselmed_qbs %>% html_nodes("h1") %>%html_text()
h1_text
h2_text <- scraping_geiselmed_qbs %>% html_nodes("h2") %>%html_text()
h2_text
h3_text <- scraping_geiselmed_qbs %>% html_nodes("h3") %>%html_text()
length(h3_text)
h3_text
h4_text <- scraping_geiselmed_qbs %>% html_nodes("h4") %>%html_text()

p_nodes <- scraping_geiselmed_qbs %>%html_nodes("p")
p_nodes[7:13]
p_text <- scraping_geiselmed_qbs %>% html_nodes("p") %>%html_text()
p_text
length(p_text)

#scraping paragraph 15
p_text[15]
ul_text <- scraping_geiselmed_qbs %>% html_nodes("ul") %>%html_text()
length(ul_text)

#scraping unordered list from the source webpage
ul_text[1]
ul_text[13]
ul_text[19]

#scraping particular text from unordered list 2
substr(ul_text[2],start=22,stop=44)

li_text <- scraping_geiselmed_qbs %>% html_nodes("li") %>%html_text()
length(li_text)
li_text[18:23]

all_text <- scraping_geiselmed_qbs %>%
  html_nodes("div") %>% 
  html_text()
  
  results <- scraping_geiselmed_qbs %>% html_nodes(".short-desc")
results

