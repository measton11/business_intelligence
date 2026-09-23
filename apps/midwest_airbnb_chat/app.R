# ISA 401 Midwest Airbnb Chat: ask questions, get SQL, a table, or a chart back
library(querychat)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client             = client,
  tools              = c("filter", "query", "visualize"),
  greeting           = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

library(shiny)
library(bslib)

ui = page_sidebar(
  title   = "Midwest Airbnb Explorer",
  theme   = bs_theme(
    primary = "#FF5A5F",
    base_font = font_google("Lato")
  ),
  sidebar = qc$sidebar(width = 350),
  card(
    card_header(textOutput("title")),
    DT::DTOutput("table")
  ),
  accordion(
    open = FALSE,
    accordion_panel("SQL", verbatimTextOutput("sql")),
    accordion_panel(
      "About",
      p("Built by Matt Easton for ISA 401 at Miami University."),
      p("Data from Inside Airbnb (insideairbnb.com)."),
      p("Covers 14,887 listings from three cities:"),
      tags$ul(
        tags$li("Chicago (2026-07-20)"),
        tags$li("Columbus (2026-07-23)"),
        tags$li("Twin Cities (2026-07-21)")
      )
    )
  )
)

server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(vals$title() %||% "All listings")
  output$table = DT::renderDT(
    vals$df(),
    options = list(pageLength = 10)
  )
  output$sql = renderText(
    vals$sql() %||% "SELECT * FROM listings"
  )
}

shinyApp(ui, server)


