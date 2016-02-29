library(shiny)


 shinyUI(fluidPage(withMathJax(),
  sidebarLayout(
    sidebarPanel(
#
# select a distribution
#  
      radioButtons("dist", "Choose a distribution",
                   c("Normal" = "norm", 
                     "Uniform" = "unif", 
                     "Bernoulli" = "bernoul")),
      br(),
#
# select a number of samples
#
      
      sliderInput("numberSamples", 
                  "Number of samples:", 
                  value = 500,
                  min = 5, 
                  max = 1000),
      br(),
#
# select a sample size
#      
      sliderInput("sampleSize", 
                  "Sample size:", 
                  value = 40,
                  min = 10, 
                  max = 70)
      ),
    
  mainPanel( 
   navbarPage("Central limit theorem",
             tabPanel("Sample mean", plotOutput("plotMeans")), 
             tabPanel("Convergence", plotOutput("plotConv")),
             tabPanel("Summary", verbatimTextOutput("summary")), 
#
# documentation
#
             tabPanel("About",
                      h2("Central limit theorem"),
                      p("This application illustates the central limit theorem on the example of three distributions:"),
                      br(),
                      p(a("* Normal",href="http://en.wikipedia.org/wiki/Normal_distribution")),
                      br(),
                      p(a("* Uniform",href="http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)")),
                      br(),
                      p(a("* Bernoulli",href="https://en.wikipedia.org/wiki/Bernoulli_distribution")),
                      br(),
                      h3("Sample mean"),
                      p(a("The central limit theorem",href="https://en.wikipedia.org/wiki/Central_limit_theorem"),"states that for
                        a sequence of independent random variables, each with finite expected value \\(\\mu_i\\) 
                        and variance \\(\\sigma_i^2\\), the quantity $$\\frac{1}{s_n}\\sum_i (X_i-\\mu_i)$$ where
                        \\(s^2_n = \\sum_{i=0}^{n} \\sigma^2_i \\), converges in distribution to a standard normal random variable.
                        This is exemplified by the plot generated under this tab."),
                      br(),
                      h3("Convergence"),
                      p('Citing Wikipedia,\"the average of the results obtained from a large number of trials should be close to the expected value, 
                         and will tend to become closer as more trials are performed\". 
                         This law is called the law of large numbers and illustrated under this tab.'),
                      br(),
                      h3("Summary"),
                      p("This produces results' summary generated with the",code("summary"),"function"), 
                      br(),
                      p(strong("(c) 2016 Sviataslau Kohut"))
                      )
    )
   )
  )
))
