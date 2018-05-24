# Call the required packages
library("dplyr")
library("shiny")
library("plotly")
#install.packages('rsconnect')

# Read and import data to R 

# Call the plot function
source("app.R")
# Run shinyServer that draws a scatter plot
shinyServer(function(input, output) {
  output$table <- renderTable({
    return(display_table(counties_data,input$state_name,input$year))
  })
  output$plot <- renderPlotly({
    return(compare_plot(counties_data,input$state_name,input$year))
  })
  
  data_frame <-  states_data %>% select(name, population, poverty.rate, median.household.income,
                                        median.property.value, eviction.rate) %>% na.omit()
  data_frame <- group_by(data_frame, name)  
    
  output$summary <- renderPrint({
    return(summary(data_frame))
  })

})