# Indicador de Resiliência Hídrica, Educação e Escolas

Este repositório contém o código e os dados utilizados para a criação de um indicador de resiliência hídrica relacionado à educação e às escolas. A metodologia e os resultados estão detalhados na publicação científica disponível em [https://doi.org/10.5194/egusphere-egu24-18385](https://doi.org/10.5194/egusphere-egu24-18385).

## Pacotes Utilizados

- **dplyr**: Utilizado para manipulação de dados, filtragem, agregação e outras operações essenciais para preparar os dados de entrada.
- **Compind**: Utilizado para o cálculo de indicadores compostos, permitindo a combinação de diferentes variáveis para gerar um índice de resiliência hídrica.
- **ggplot2**: Utilizado para a visualização de dados, criando gráficos e mapas que ajudam na interpretação dos resultados.
- **sf**: Utilizado para manipulação de dados espaciais, facilitando a análise geoespacial dos dados das escolas e a resiliência hídrica.
- **shiny**: Utilizado para a criação de uma aplicação interativa que permite aos usuários explorar os dados e os resultados de maneira intuitiva.
- **leaflet**: Utilizado para a criação de mapas interativos que permitem aos usuários visualizar e interagir com os dados geoespaciais de maneira dinâmica.

## Dados de Entrada

Os dados de entrada utilizados para o cálculo do indicador de resiliência hídrica incluem:

- **Dados de escolas**: Informações do Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP). Fonte: [https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos)
- **Dados ambientais**: Informações do MapBiomas sobre as áreas de cobertura florestal. Fonte: [https://brasil.mapbiomas.org/en/](https://brasil.mapbiomas.org/en/)
- **Dados sobre desastres**: Informações sobre áreas de risco de desastres geo-hidrológicos do Centro Nacional de Monitoramento e Alertas de Desastres Naturais (Cemaden/MCTI). Fonte: [https://www.gov.br/cemaden/pt-br](https://www.gov.br/cemaden/pt-br).


## Aplicativo Shiny

Criamos uma aplicação interativa utilizando o pacote **shiny** para permitir que os usuários explorem os dados e os resultados do indicador de resiliência hídrica. O aplicativo possui as seguintes funcionalidades:

- **Visualização de mapas**: Mapas interativos que mostram a distribuição da resiliência hídrica nas escolas, permitindo que os usuários explorem diferentes regiões e identifiquem áreas de maior ou menor resiliência.
- **Filtros interativos**: Ferramentas que permitem aos usuários filtrar os dados por diferentes critérios, como localização geográfica, tipo de escola, entre outros.
- **Gráficos dinâmicos**: Gráficos que mostram a relação entre diferentes variáveis e o indicador de resiliência hídrica, ajudando na interpretação dos dados.
- **Relatórios personalizados**: Funcionalidade para gerar relatórios personalizados com base nos filtros e visualizações selecionadas, facilitando a comunicação dos resultados.

