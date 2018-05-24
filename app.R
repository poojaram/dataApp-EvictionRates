# Call the required packages
library("dplyr")
library("plotly")

counties_data <- read.csv("data/evictionlab-us-counties.csv", header = TRUE, stringsAsFactors = FALSE)
states_data <- read.csv("data/evictionlab-us-states.csv", header = TRUE, stringsAsFactors = FALSE)

#Table
display_table <- function(counties_data, state_name, my_year){
  # Filters through the data based on user inputs 
  filtered_data <- counties_data %>%
    filter(year == my_year & parent.location == state_name) %>%
    select(name, poverty.rate) 
  return(filtered_data)
}

# Visualisation
compare_plot <- function(counties_data, state_name, my_year){
  # Filters through the data based on user inputs 
  filtered_data <- counties_data %>%
    filter(year == my_year) %>%
    filter(parent.location == state_name) %>%
    select(name, poverty.rate) 
  x <- list(title = "County names")
  y <- list(title = "Poverty rates")
  # Generates plot based on the data and changes color if the calories are greater than 3

  plot <- plot_ly(filtered_data,x=filtered_data$name,y=filtered_data$poverty.rate,type = "scatter",color = "red") %>% 
    layout(xaxis = x, yaxis = y,margin = list(b = 160), xaxis = list(tickangle = 45))
  return(plot)
}