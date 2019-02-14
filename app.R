library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("Gapminder Replica"),
  sidebarLayout(
    sidebarPanel (
      helpText("Create a Gapminder Rosling graph with 
               data from the World Bank:"),
      radioButtons("radio", label = h3("GDP Per Capita"),
                   choices= c("log", "linear"), selected = "log"),
      
      radioButtons("radio2", label = h3("Y Variable"),
                   choices= c("log", "linear"), selected = "log"),
      
      selectInput("dropdown", 
                  label = "Choose a variable to display:",
                  c("Total Fertility", 
                    "CO2 Emissions (metric tons per capita)",
                    "Life Expectancy at Birth", 
                    "Child Mortality (per 1,000 births"),
                  selected = "Total Fertility (births per woman)"),
      sliderInput(inputId="year", label="Select a Year", value=1990, min=1990, max=2016, animate=TRUE, sep = "")
      ),
    mainPanel(plotOutput("rosling"))
)

  )

# Define server logic ----
server<-function(input, output, session) {
  filename<-read.csv("./Data/proj.csv")
  output$rosling<-renderPlot({
    if(input$radio2=="log") {
      xvar<-switch(input$radio,
                   "log"=log(filename$gdppercap),
                   "linear"= filename$gdppercap)
      yvar <-switch(input$dropdown,
                    "Total Fertility"=log(filename$TOTALFERTILITY),
                    "CO2 emissions" = log(filename$CO2EMISSIONS),
                    "Life Expectancy" = log(filename$LIFEEXPECTANCY),
                    "Child Mortality" = log(filename$CHILDMORTALITY))
      plot(xvar[filename$year==input$year], yvar[filename$year==input$year],
           cex=(filename$POPULATION[filename$year==input$year]/100000000)+1, pch=21, bg=c("#24d5e7", "#83e92C" ,"#FC5A75","#FEE533")[filename$factorregions[filename$year==input$year]],
           main = "GDP Impact on Social Factors", xlab = "GDP Per Capita", ylab = input$dropdown)
      legend("topright", legend=c("Africa", "Asia", "Americas", "Europe"),
             col=c("#24d5e7", "#83e92C" ,"#FC5A75","#FEE533"), lty=1,lwd=3, cex=0.8)}
    else if(input$radio2=="linear") {
      xvar<-switch(input$radio,
                   "log"=log(filename$gdppercap),
                   "linear"= filename$gdppercap)
      yvar <-switch(input$dropdown,
                    "Total Fertility"= filename$TOTALFERTILITY,
                    "CO2 emissions" = filename$CO2EMISSIONS,
                    "Life Expectancy" = filename$LIFEEXPECTANCY,
                    "Child Mortality" = filename$CHILDMORTALITY)
      plot(xvar[filename$year==input$year], yvar[filename$year==input$year], 
           cex=(filename$POPULATION[filename$year==input$year]/100000000)+1, pch=21, bg=c("#24d5e7", "#83e92C" ,"#FC5A75","#FEE533")[filename$factorregions[filename$year==input$year]],
           main = "GDP Impact on Social Factors", xlab = "GDP Per Capita", ylab = input$dropdown)
      legend("topright", legend=c("Africa", "Asia", "Americas", "Europe"),
             col=c("#24d5e7", "#83e92C" ,"#FC5A75","#FEE533"), lty=1, lwd=3, cex=0.8)}
  }
  
  )}

# Run the app ----
shinyApp(ui = ui, server = server)