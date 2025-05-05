
library(quantmod)
library(TTR)


stock_symbols <- c("AAPL", "MSFT", "GOOGL", "AMZN", "TSLA", "NVDA", "META")


start_date <- as.Date("2022-01-01")
end_date <- Sys.Date()


for (symbol in stock_symbols) {
  
  getSymbols(symbol, src = "yahoo", from = start_date, to = end_date, auto.assign = TRUE)
  
 
  stock_data <- get(symbol)
  close_prices <- Cl(stock_data)
  
  
  sma50 <- SMA(close_prices, n = 50)
  sma200 <- SMA(close_prices, n = 200)
  
  
  cat("\n📊 Plotting:", symbol, "\n")
  chartSeries(stock_data,
              name = paste(symbol, "with 50-day and 200-day SMA"),
              theme = chartTheme("white"),
              TA = "addSMA(50, col = 'blue'); addSMA(200, col = 'red')")
  
  
  Sys.sleep(2) 
}
