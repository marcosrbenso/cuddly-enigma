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

  ### Indicador de Resiliência Hídrica, Educação e Escolas

#### Desastres (BATER & Cemaden)

- **Áreas de risco (risco - km²)**: Áreas de risco monitoradas pelo Cemaden.
- **Municípios monitorados pelo Cemaden (monitorado - binário)**: Indicador binário que identifica se o município é monitorado pelo Cemaden.
- **Número de estações hidrológicas de monitoramento de risco (estacoes - contagem)**: Contagem do número de estações hidrológicas de monitoramento de risco em cada região.

#### Escolas (INEP - 2022)

- **Número de escolas (escolas - contagem)**: Contagem do número de escolas.
- **Número de alunos (alunos - contagem)**: Contagem do número de alunos matriculados.
- **Número de professores (docentes - contagem)**: Contagem do número de professores.

#### Ambiental (MapBiomas - 2022)

- **Área florestada e não antropizada (floresta - km²)**: Área de cobertura florestal não modificada por atividade humana.

#### Resiliência (ISH - ANA 2017)

- **Volume Potencial por Ottobacia (S1_ivv_nu - hm³/km²)**: Volume potencial de água por unidade de área.
- **Adimensional (S2_ivv_nu - Razão Q95 / QMLT)**: Razão entre o fluxo de água disponível 95% do tempo (Q95) e o fluxo médio de longo termo (QMLT).
- **Potencial de Armazenamento Subterrâneo (S3_ivv_classe - categórico)**: Classificação categórica do potencial de armazenamento subterrâneo.
- **Variabilidade Pluviométrica - Adimensional (S4_ivv_nu - % CV da chuva anual)**: Coeficiente de variação percentual da chuva anual, indicando a variabilidade pluviométrica.


## Aplicativo Shiny

Criamos uma aplicação interativa utilizando o pacote **shiny** para permitir que os usuários explorem os dados e os resultados do indicador de resiliência hídrica. O aplicativo possui as seguintes funcionalidades:

- **Visualização de mapas**: Mapas interativos que mostram a distribuição da resiliência hídrica nas escolas, permitindo que os usuários explorem diferentes regiões e identifiquem áreas de maior ou menor resiliência.
- **Filtros interativos**: Ferramentas que permitem aos usuários filtrar os dados por diferentes critérios, como localização geográfica, tipo de escola, entre outros.
- **Gráficos dinâmicos**: Gráficos que mostram a relação entre diferentes variáveis e o indicador de resiliência hídrica, ajudando na interpretação dos dados.
- **Relatórios personalizados**: Funcionalidade para gerar relatórios personalizados com base nos filtros e visualizações selecionadas, facilitando a comunicação dos resultados.

