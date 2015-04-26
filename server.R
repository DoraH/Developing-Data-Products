library(shiny) 

BMI<-function(weight,height) {weight/(height^2)}

diagnostic_f<-function(weight,height){
        BMI_value<-weight/(height^2)
        ifelse(BMI_value<18.5,"Underweight. You are at low risk for cardiovascular diseases and type 2 diabetes. However, your weight is in the unhealthy range for your height as you are at an increased risk of nutritional deficiencies and osteoporosis. Maintain your BMI value within 18.50 to 24.99 to stay healthy.",
        ifelse(BMI_value<25,"Normal range. You are at low risk for cardiovascular diseases and type 2 diabetes. Your weight is in the healthy range for your height. Maintain your BMI value within 18.50 to 24.99 to stay healthy.",
        ifelse(BMI_value<30,"Overweight. Your weight is in the unhealthy range for your height. You are at moderate risk of developing cardiovascular diseases (such as heart attack) and diabetes. Keep your BMI value within 18.50 to 24.99 to reduce your risk of developing these diseases.",
        "Obese. Your weight is in the very unhealthy range for your height. You are at high risk of developing cardiovascular diseases (such as heart attack) and diabetes. Keep your BMI value within 18.50 to 24.99 to reduce your risk of developing these diseases.")))
}

shinyServer(
        function(input, output) {
                
                output$inputweightvalue <- renderPrint({input$weight})
                output$inputheightvalue <- renderPrint({input$height})
                output$estimation <- renderPrint({BMI(input$weight,input$height)})
                output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
        } 
)