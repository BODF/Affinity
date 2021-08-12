#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to make a plot
shinyServer(function(input, output) {
   
  output$KaPlot <- renderPlot({
        
        # Make an empty plotting surface that won't change as we change Ka
        plot(c(1e-09, 1e-04), c(0,1), type = 'n', log ='x', axes="F", 
             xlab = "Concentration of X (Molar)", ylab = "Fraction of Y bound",
             main = "Hypothetical binding curve for two molecules",
             cex.main = 1.3, cex.lab = 1.2)
        # add nice logarithmic axes
        axis(2, lwd = 3)
        axis(1, lwd = 3, cex.axis = 1.2, labels = 
                     c(expression(10^-9), expression(10^-8), expression(10^-7), 
                       expression(10^-6), expression(10^-5), expression(10^-4)), 
             at =c(10^-9, 10^-8, 10^-7, 10^-6, 10^-5, 10^-4))
        axis(1, lwd = 1, labels=FALSE, 
             at = sort(rep(1:9,6))*c(1e-9,1e-8,1e-7,1e-6,1e-5,1e-4))
        box(lwd = 3)
        
        # Draw a line dictated by the input Ka, transform the input with the 
        # equation in the intro text.
        ka <- input$K
        curve((x*ka)/(1 + x*ka), from = 1e-09, to = 1e-04, lwd = 2, add = TRUE)
  })
  
})
