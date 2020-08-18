library(shiny)

shinyUI(fluidPage(

    titlePanel("How Long Will It Take Me To Stop my 1920s Car?"),

    # Sidebar with a slider input for speed
    sidebarLayout(
        sidebarPanel(
            sliderInput("speedinput",
                        "How fast is the car going (in mph)?:",
                        min = 1,
                        max = 25,
                        value = 10)
        ),

        # Show a plot of the linear model and calculated prediction
        mainPanel(
            h3("Predicted stopping distance from R cars dataset (ft):"),
            textOutput("pred1"),
            plotOutput("plot1")
        )
    )
))
