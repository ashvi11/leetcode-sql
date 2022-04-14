
#Approach 1-
select stock_name, sum(price * case when operation = 'Buy' then -1 else 1 end) as capital_gain_loss 
from Stocks 
group by 1

#here, multiply the price with -1 if it is buy, else 1 and calculate the sum


#Approach 2-
select stock_name, 
sum(case when operation = 'Sell' then price else null end) - sum(case when operation = 'Buy' then price else null end) as capital_gain_loss 
from Stocks 
group by 1

#here, sum when operations = buy - sum when operations = sell

#Approach 2- solved myself
with res as (SELECT sell.stock_name, sell.total_sell, buy.total_buy FROM 
(select stock_name, sum(price) as total_sell from Stocks where operation = 'Sell' group by stock_name) sell, 
(select stock_name, sum(price) as total_buy from Stocks where operation = 'Buy' group by stock_name)buy
where sell.stock_name = buy.stock_name)

select stock_name, total_sell-total_buy as capital_gain_loss from res

# here, I made two columns- total buy for each stock and total sell for each stock, the subtracted it in the query
