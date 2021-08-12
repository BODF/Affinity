#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# deploy with >rsconnect::deployApp('~/Documents/Classes/DataSciCourse/Affinity')
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulating Thermodynamic Binding"),
  
  h1("Background"),
  p("The thermodynamic concept of binding is important for understanding drug 
    design and efficacy, but binding is often difficult for students to 
    gain an intuitive grasp of, so I have always preferred using simulations 
    as a pedagogical tool. Here is a simple simulation of two molecules binding 
    one another. One molecule is observed (y-axis) for its bound form (there 
    are multiple ways to observe binding, not covered here). The other molecule 
    is titrated into the solution. As its concentration increases, more 
    binding occurs. But the binding is not a simple line, it is described by 
    this equation:"),
  br(),
  p("Fraction of Y bound to X = ([X]*Ka) / (1 + [X]*Ka), where Y and X are two 
    molecules that bind, [X] means the concentration of X,
    and Ka is the affinity constant for this reaction."),
  br(),
  p("In the above equation, it is the affinity constant that represents the 
    energy (strength) of binding. It is critical that students understand how 
    the Ka affects binding, and simulation of the above equation helps."),
  p("In the below code I plot a hypothetical binding curve and give the user 
    the option of sliding the Ka value up and down, within a set of reasonable 
    values. You should observe what happens to the binding curve as Ka 
    becomes larger (stronger energy of binding) versus lower."),
  
  # Sidebar with a slider input for affinity
  sidebarLayout(
    sidebarPanel(
       sliderInput("K",
                   "Choose a Ka (units of Molar^-1):",
                   min = 1e+05,
                   max = 1e+08,
                   value = 1e+07)
    ),
    
    # Show a plot
    mainPanel(
       plotOutput("KaPlot")
    )
  )
))
