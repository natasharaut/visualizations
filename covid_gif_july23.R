library(plotly)
library(pool)
library(ggplot2)
library(gganimate)
library(dplyr)
library(dbplyr)

covid_data_new= read.csv('Desktop/full_data.csv', stringsAsFactors = FALSE)

covid_data_new$date <- as.Date(covid_data_new$date)


head(covid_data_new)

custom <- filter(covid_data_new, location %in% c('India', 'United States', 'Canada', 'China', 'United Kingdom', 'Japan', 'Germany', 'Pakistan'))
head(india)


my_plot <- ggplot(custom,aes(x = date)) +
  geom_point(aes( y =total_cases, color=location, size=new_cases), show.legend = TRUE) +
  transition_time(date) +
  shadow_mark(alpha = 0.3, size = 0.5)  +
  view_follow(fixed_y = TRUE) +
  theme(panel.background = element_rect(fill= "white", colour="black")) + 
  labs(subtitle = 'Day: {frame_time}', title="Total COVID-19 Cases Daily till 23rd July, 2020", x= "Month", y="Total Cases")

animate(my_plot, renderer = gifski_renderer(), duration = 11)
anim_save("a_sample_plot.gif", animation = last_animation(), path = NULL)

#shadow_mark(alpha = 0.3, size = 0.5) 
#shadow_wake(wake_length = 0.1, alpha = FALSE)