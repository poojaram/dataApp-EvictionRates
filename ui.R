############ui.R############
# Call the required packages
library("shiny")
library("dplyr")
library("plotly")

source("app.R")

# Define UI for application that draws a scatter plot
shinyUI(fluidPage(
  titlePanel("Poverty Rate at County Level"),
  h3("By Pooja Shree Ramanathan"),
  h4("This is visual analysis used the Eviction Data from Princeton University"),
  h5("Here we are finding a scatter plot for every county in the United states grouped based on their respective States.
     There is a drop down list of all the states from which you can select any one to filter the data
     that is being plotted and analyzed. The slider gives the beginning to end year from which you can chose any year to filter out the
     data accordingly."),
  h5("There are three tabs Plot Data, Table Data and Summary Data and you can switch between the three by clicking e tabs."),
  h4("Table Data: Consists of the ata that is being plotted on the scatter plot"),
  h4("Summary Data: Consists of the Sumary of poverty rate, population, medium household income,
     median property value and eviction rate of all the data in the states data together."),
  sidebarLayout(
    sidebarPanel(
      mainPanel(
        selectInput('state_name', "Select a State to filter:", unique(counties_data$parent.location))
      ),
      br(),
      br(),
      br(),
      br(),
      sliderInput("year", "Choose a year to filter:",
                  min = 2000, max = 2016, step = 1, value = 2000)
    ),
    # Show a plot of the output
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot Data", plotlyOutput("plot")),
                  tabPanel("Table Data", tableOutput("table")),
                  tabPanel("Summary Data", verbatimTextOutput("summary"))
      )
    )
  )  
)
)