#sliderMPG
#plot1
#pred1
library(shiny)
shinyServer(function(input, output) {
   #prework
    model <- lm(dist ~ speed, data = cars)
    
    #make model reactive so moving point on plot works
    prediction <- reactive({
        speed <- input$speedinput
        predict(model, newdata = data.frame(speed))
    })
    
    #text calc
    output$pred1 <- renderText({
        speed <- input$speedinput
        
        prediction <- predict(model, newdata = data.frame(speed))
    })
    
    #plot calc
    output$plot1 <- renderPlot({
        speed <- input$speedinput

        plot(cars$speed, cars$dist, xlab="Speed (MPH)", ylab="Stopping Distance (ft)", bty = "n", pch = 16)
        abline(model, col = "red", lwd = 4)
        points(speed, prediction(), col = "red", pch=19,cex=4)
    })
})