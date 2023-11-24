# Load required libraries
library(shiny)
library(palmerpenguins)
library(DT)
library(tidyverse)
library(dplyr)


# As a researchers, we often want to see how a continuous variable 
# varies across different categories of categorical variables.
# I created this shiny app to allow users to customize and compare
# the differences in body mass of penguins with respect to the species they belong to,
# the year the measurements were taken, the island where they were sampled from, and
# the sex of the penguins.
# The box plot allows users to quickly visualize the differences and if there are any outliers
# The summary table provides more summary statistics (e.g. mean, median, max, min, and standard deviation)
# across these comparison.

# Define UI for application
ui <- fluidPage(
  
  # Title of Shiny app
  titlePanel("Palmer Penguins Data Visualization"),
  
  # Sidebar layout
  sidebarLayout(
    #Side bar panel
    
    sidebarPanel(
      img(src = "penguins.png", height = 100, width = 100),
      # Feature 1: Drop down menu to select categorical variable for which body mass of penguins are to be summarized
      #  The box plot compares whether penguins body mass differs with species, and to which island they belong to and their sex.
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Species" = "species",
                    "Island" = "island",
                    "Sex" = "sex",
                    "Year" = "year")),
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE),
      h4("Introduction", style = "font-family: helvetica"),
      p("This Shiny app provides customized summary of Palmer penguins data
       collected at the Palmer Station, Antarctica by a team of Long Term Ecological Research Network. The dataset includes measurements of
       body mass, bill depth, bill length, and flipper length of three species of penguins  Adelie, Chinstrap, and Gentoo from three different
       islands Biscoe, Dream, and Torgensen within the Palmer Archipelago of Antarctica between the years 2007 to 2009.", 
        style = "font-family: helvetica"),
      br(),
      br(),
      a(href="https://allisonhorst.github.io/palmerpenguins/index.html", "(The main link to the `palmerpenguins` R package here)", 
        style = "font-family: helvetica"),
 #   ),
  
  ),
  
  mainPanel(
   # h3(textOutput("caption")),
    
   # plotOutput("bodymassPlot")
    tabsetPanel(type = "tabs",
                tabPanel("Box Plot", plotOutput("bodymassPlot")),
                tabPanel("Summary Table", verbatimTextOutput("summary_text")),
                tabPanel("Penguins Table", DTOutput("penguins_table"),downloadButton("downloadData", "Download"))
    )
  )
)
)

# Define server logic
server <- function(input, output) {
  # Compute the formula text
  # This is in a reactive expression to create customized box plots
  # for body mass against selected categorical variables
  # output$caption and output$bodymassPlot functions
  formulaText <- reactive({
    paste("body_mass_g ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against body mass
  
  # and only exclude outliers if requested
  output$bodymassPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = penguins,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
  
  summary_text <- reactive({
    penguins %>% 
      group_by_at(vars(input$variable)) %>% 
      summarise(
        Mean = mean(body_mass_g/1000, na.rm=TRUE),
        SD = sd(body_mass_g/1000, na.rm=TRUE),
        Max = max(body_mass_g/1000, na.rm=TRUE),
        Min = min(body_mass_g/1000, na.rm=TRUE),
        Median= median(body_mass_g/1000, na.rm=TRUE)
      )
      })
  

  
  output$summary_text <- renderPrint({
  summary_text()
    })
  
  
  
  
  data("penguins")
  
  # Create a reactive table for penguins dataset
  output$penguins_table <- renderDT({
    datatable(penguins, options = list(pageLength = 10), rownames = FALSE)
  })
  
  # Downloadable csv of penguins dataset-

  output$downloadData <- downloadHandler(
   filename = function() {
    paste("penguins_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
     write.csv(penguins, file, row.names = FALSE)
    }
  )
}


# Run the application
shinyApp(ui = ui, server = server)