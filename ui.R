library(shiny) 

shinyUI(
        pageWithSidebar(
                
                # Application title
                headerPanel("Know Your Body Mass Index (BMI), Know Your Risk"),
                
                
                sidebarPanel(
                        numericInput('weight', 'Enter your weight in kilograms', 0) ,
                        numericInput('height', 'Enter your height in metres', 0, min = 0, max = 3, step = 0.01),
                        submitButton('Submit')
                ),
                
                mainPanel(
                        p('Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight and obesity in adults. It is defined as the weight in kilograms divided by the square of the height in metres.'),
                        p('Below are the International Classification according to the BMI of an adult by World Health Organization (WHO):'),
                        tags$div(
                                tags$ul(
                                        tags$li('BMI <18.50          : Underweight'),
                                        tags$li('BMI [18.50 - 24.99] : Normal range'),
                                        tags$li('BMI [25.00 - 29.99] : Overweight'),
                                        tags$li('BMI >=30.00         : Obese')
                                )
                        ),
                        
                        h4('You have entered:'), 
                        p('weight:'), verbatimTextOutput("inputweightvalue"),
                        p('height:'), verbatimTextOutput("inputheightvalue"),
                        h4('Your BMI is:'),
                        verbatimTextOutput("estimation"),
                        verbatimTextOutput("diagnostic")
                        
                        
                )
                
        )   
)
