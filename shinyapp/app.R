library(shiny)
library(shinydashboard)
library(leaflet)
library(sf)


# Carregar os dados
school_data_app <- read_sf("school_data.shp")
bacia_corumbatai <- read_sf("dem_corumbatai.shp")
stations_app <- read_sf("stations.shp")
bater_app <- read_sf("bater.shp")
bater_app$area <- st_area(bater_app)

# Paleta de cores para o mapa
pal <- colorFactor(c("#ABD592", "#FFF46D", "#FFA64C"), domain = c("Alto", "Médio", "Baixo"))

# Extrair nomes únicos das escolas para a lista de seleção
school_names <- unique(school_data_app$NO_ENTI)

# UI
ui <- dashboardPage(
  dashboardHeader(title = "Segurança hídrica nas escolas brasileiras"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introdução", tabName = "introduction", icon = icon("info-circle")),
      menuItem("Formulário", tabName = "form", icon = icon("edit")),
      menuItem("Link o formulário", tabName = "link", icon = icon("link"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "introduction",
        fluidRow(
          box(title = "Introdução do projeto", status = "info", solidHeader = TRUE, width = 12,
              "O projeto de Resiliência Hídrica nas Escolas Brasileiras, que faz parte do Observatório Nacional de Segurança Hídrica e Gestão Adaptativa (ONSEADAdapta), é um esforço que visa promover a conscientização e a preparação das comunidades escolares para lidar com os desafios relacionados à água. Esse projeto busca promover o engajamento dos alunos, professores e gestores escolares na gestão sustentável dos recursos hídricos, bem como o enfrentamento de desastres hídricos."
          ),
          leafletOutput("map", width = "100%", height = "600px")
        )
      ),
      tabItem(
        tabName = "form",
        fluidRow(
          box(title = "Formulário de Pesquisa", status = "primary", solidHeader = TRUE, width = 12,
              textInput("email", "Email:"),
              radioButtons("role", "Selecione o seu papel:",
                           choices = c("Docente", "Estudante", "Familiar", "Funcionário")),
              selectInput("school", "Selecione a Escola:", choices = school_names),
              textAreaInput("experience_drought", "Relato de experiência de Seca:", "", rows = 4),
              textAreaInput("experience_flood", "Relato de Experiência de Inundação:", "", rows = 4),
              actionButton("submit", "Enviar", icon = icon("paper-plane"))
          )
        )
      ),
      tabItem(
        tabName = "link",
        fluidRow(
          box(title = "Form Link", status = "success", solidHeader = TRUE, width = 12,
              actionButton("goToLink", "Responda ao formulário para participar", icon("external-link"))
          )
        )
      )
    )
  )
)

# Server
server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet('Esri.WorldImagery') %>%
      addTiles() %>%
      addPolygons(data = bacia_corumbatai, fillOpacity = 0.03, weight = 1.2) %>%
      addPolygons(data = bater_app,
                  color = "yellow",
                  fillOpacity = 0.9, weight = 1.2,
                  label = ~"Área de Risco",
                  popup = ~paste("Área de Risco",
                                 "<br>Código da Geo Bater:", GEO_BATER,
                                 "<br>Área (m²):", area)) %>%
      addMarkers(data = stations_app,
                 icon = ~ iconList(
                   "diamond" = makeIcon(
                     iconUrl = "https://upload.wikimedia.org/wikipedia/commons/2/2c/Triangle_blue_icon.svg",
                     iconWidth = 10,
                     iconHeight = 10
                   ))["diamond"],
                 label = ~codEstc,
                 popup = ~paste(codEstc,
                                "<br>Código da Estação Cemaden:", codEstc,
                                "<br>Município:", municip)) %>%
      addCircleMarkers(data = school_data_app,
                       label = ~NO_ENTI,
                       popup = ~paste(NO_ENTI,
                                      "<br>Índice Seguraça Hídrica (ISH/ANA 2017):", brasil,
                                      "<br>Município:", paste(NO_MUNI, SG_UF, sep = ' - '),
                                      "<br>Matrículas em 2022:", QT_MAT_),
                       radius = 4,
                       color = ~pal(brasil),
                       stroke = FALSE,
                       fillOpacity = 1)
  })

  observeEvent(input$submit, {
    showModal(modalDialog(
      title = "Formulário Enviado",
      "Obrigado por preencher o formulário!",
      easyClose = TRUE,
      footer = NULL
    ))
  })

  observeEvent(input$goToLink, {
    jscode <- 'window.open("https://forms.gle/AXBhyajCTq9BzisX8", "_blank");'
    session$sendCustomMessage("jsCode", jscode)
  })
}

shinyApp(ui, server)
