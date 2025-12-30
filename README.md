# 📊 Dashboard de Performance de Vendas & Logística (Olist)

[![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-brightgreen?style=for-the-badge)](https://github.com/MilenaS3/Analise-Performance-Olist)
[![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://github.com/MilenaS3/Analise-Performance-Olist/blob/main/Dashboard.png)
[![SQL Server](https://img.shields.io/badge/SQL_Server-Queries-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://github.com/MilenaS3/Analise-Performance-Olist/blob/main/SQLQuery_tratamento.sql)

## 🖼️ Visão Geral do Painel

![Dashboard Completo](https://github.com/MilenaS3/Analise-Performance-Olist/blob/main/Dashboard.png)
*(Visão geral do painel executivo focado em KPIs de vendas e logística)*

## 💼 O Desafio de Negócio

Este projeto analisa dados reais do **Olist** (E-commerce brasileiro) para responder a perguntas estratégicas da diretoria sobre a operação entre 2016 e 2018:

1.  **Evolução do Faturamento:** O crescimento das vendas é consistente ou sazonal?
2.  **Eficiência Logística:** Onde estão os gargalos de entrega no Brasil?
3.  **SLA de Entrega:** Estamos cumprindo o prazo prometido ao cliente?

## 🛠️ Tecnologias Utilizadas

* **SQL Server:** Extração, limpeza de dados (Data Cleaning) e criação de Views para otimizar a performance.
* **Power BI:** Modelagem de dados (Star Schema), cálculos avançados DAX e Storytelling.
* **PowerPoint:** Criação de background e identidade visual personalizada.

## ⚙️ Etapas do Projeto

### 1. Tratamento de Dados (SQL)
Os dados brutos continham problemas de tipagem e registros nulos. Foi criada uma View (`vw_fVendas`) no SQL para garantir a integridade antes da importação:
* Correção de tipos de dados (String para Decimal em valores monetários).
* Cálculo de `Dias_Atraso` direto na fonte.
* Unificação de tabelas de Pedidos e Itens.

### 2. Modelagem (Star Schema)
No Power BI, o modelo foi estruturado com tabela Fato (`fVendas`) e Dimensões (`dCalendario`, `dClientes`, `dProdutos`), garantindo alta performance nos filtros.

### 3. Análises e DAX
Principais medidas criadas:
* **% SLA de Entrega:** `CALCULATE(COUNTROWS(Vendas), Dias_Atraso <= 0) / COUNTROWS(Vendas)`
* **Ticket Médio:** Análise do valor médio gasto por pedido.
* **Comparativo Anual:** Visualização de tendências ano contra ano (YoY) para identificar sazonalidade.

---

## 🚀 Principais Insights

### 1. Evolução do Faturamento (Crescimento)
![Análise Temporal](https://github.com/MilenaS3/Analise-Performance-Olist/blob/main/Analise_Temporal.png)
* **📈 Tendência de Alta:** Ao comparar o período de Janeiro a Agosto, o faturamento de 2018 superou consistentemente o de 2017, validando o crescimento da operação.
* **⚠️ Nota sobre os dados:** A queda abrupta visualizada a partir de setembro de 2018 deve-se ao fim da janela temporal do dataset público, e não a uma perda real de receita.

### 2. Eficiência Logística (Gargalos Regionais)
![Análise Logística](https://github.com/MilenaS3/Analise-Performance-Olist/blob/main/Analise_Logistica.png)

* **🚚 Disparidade Regional:** A análise geográfica revelou onde estão os principais ofensores do SLA. Enquanto a região **Sudeste** mantém entregas acima de 90% de eficiência, o **Nordeste** sofre com graves gargalos.
* **📍 Pontos Críticos:** Estados como **Alagoas (AL)** e **Maranhão (MA)** apresentam taxas de entrega no prazo inferiores a **85%**.
* **💡 Ação Recomendada:** É urgente revisar os contratos com transportadoras nessas rotas ou ajustar o cálculo de *Lead Time* (prazo prometido) no site para essas regiões, evitando gerar frustração no cliente.

### 3. SLA de Entrega (Meta vs. Realizado)
* **❌ Meta não atingida:** Respondendo à questão estratégica sobre o cumprimento de prazos, a empresa **não atingiu a meta global**.
* **📊 Os Números:** O indicador de entregas no prazo fechou em **93,55%**, ficando abaixo do objetivo estipulado de **95%**. Isso indica que, apesar da alta performance, a promessa feita ao cliente no checkout foi quebrada em quase 7% dos casos.

---

## 📂 Fonte de Dados

O conjunto de dados utilizado neste projeto é público e foi disponibilizado pela **Olist** (maior loja de departamentos dos marketplaces brasileiros).

[![Kaggle](https://img.shields.io/badge/Kaggle-Dataset-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

* **Dataset:** Brazilian E-Commerce Public Dataset by Olist
* **Período Analisado:** 2016 a 2018
* **Registros:** +100k pedidos reais (anonimizados)

---

**Autor:** Milena Soares de Oliveira
[LinkedIn](https://www.linkedin.com/in/milena-soares12/)
