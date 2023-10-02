# COVID-19 and Its Impact on the Greek Stock Market

## Project Overview

This project analyzes the impact of the COVID-19 pandemic on the Greek stock market. By comparing stock market data with the progression of the pandemic, we seek to understand the potential correlation and causation between the two.

## Data Sources

- **COVID-19 Data**: Extracted from [Our World in Data](https://ourworldindata.org/coronavirus)
- **Greek Stock Market Data**: Extracted from [Yahoo Finance](https://finance.yahoo.com/quote/GD.AT/history?p=GD.AT)

## Tools Used

- **Microsoft SQL Server Management Studio**: For data storage, management, and SQL analysis.
- **Tableau**: For visualization and generating the dashboard. Check out the [Tableau Public Dashboard here](https://public.tableau.com/app/profile/dimitrios.iatropoulos/viz/Covid-19andImpactontheGreekStockMarket/Dashboard1?publish=yes).

## SQL Analysis Files

The project leverages two primary SQL files for its analysis:

### 1. [SQL-Analysis.sql](./SQL-Analysis.sql)

- **Overview of Data**: Initial exploration of the `covid_data` and `greek_stock_market` tables to grasp the dataset's structure.

#### Analysis by Location:

  - **Death Rate by Date**: Shows the likelihood of dying if one contracts Covid-19 in Greece over time.
  - **Infection Rate by Date**: Displays the percentage of the Greek population contracting Covid-19 over time.
  - **Overall Highest Infection Rate**: Highlights the peak infection rate in Greece during the observed timeframe.
  - **Highest Death Count by Population**: Pinpoints the most significant death count in Greece and the corresponding death rate by population.

#### Analysis by Vaccination:

  - **Rolling Vaccinations by Date**: Chronicles the rolling count of new vaccinations in Greece.
  - **Percentage of Vaccinated Population**: Utilizes a CTE to compute the cumulative percentage of the Greek population that has been vaccinated over time.

#### Impact on Greek Stock Market:

  - **Infection & Death Rate vs. Stock Price**: Contrasts the infection and death rates against the Greek stock market index price across time.

### 2. [SQL-Tableau.sql](./SQL-Tableau.sql)

This file contains SQL queries explicitly crafted to channel data into Tableau for the purpose of visualization.




## Dashboard Insights

1. **Timeline of Cases, Deaths, and Stock Prices**:
    - Displays the progression of COVID-19 cases and deaths in Greece over time, contrasted  with the stock market prices. It provides a clear picture of how the Greek stock market responded to the pandemic's progression.
   
2. **Infection Rate vs. Stock Prices**:
    - Compares the rate of COVID-19 infections (as a percentage of the population) to stock prices over time. It provides insights into any correlation between the spread of the virus and stock market performance. 
    - An average line has been added to the dual-axis charts to give better clarity on the general trend of data.
   
3. **Death Rate vs. Stock Prices**:
    - Compares the death rate (as a percentage of the population) due to COVID-19 to the stock prices. It helps to understand if there's a deeper impact on the stock market due to the virus's mortality rate.
    - A forecast model has been incorporated to predict future trends based on current and historical data.

4. **Vaccination Progress**:
    - Tracks the progress of COVID-19 vaccinations in Greece over time, providing a timeline of new vaccinations and cumulative vaccinations. 

5. **2023 Metrics**:
    - Provides a snapshot of the current situation in Greece, showing the latest date of data, total cases, total deaths, and the latest stock price.
  

      ![Alt text](https://github.com/jimiatro/COVID-19-and-Its-Impact-on-the-Greek-Stock-Market/blob/main/Dashboard.png)

## Conclusions

- The pandemic's progression, as indicated by the infection and death rates, appears to have a significant impact on the Greek stock market.
  
- The progress of vaccinations can have a substantial influence on public sentiment and economic activity, possibly leading to a positive outlook in the stock market as it signifies a return to normalcy and potential economic recovery.
  
- The summary metrics offer a concise overview, aiding in quick decision-making or understanding the current scenario.


## License 

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Feedback 
I would love to hear your thoughts on my project! If you have any suggestions or comments, please feel free to open an issue or send me an email at jimiatro@hotmail.com.

