#First, run agents_sample_database.sql to create tables

#how many agents make between 0.12 and 0.14 commision 
SELECT COUNT(*)
FROM Agents
WHERE COMMISSION BETWEEN 0.12 AND 0.14;

#How much outstanding is there in the UK?
SELECT SUM(OUTSTANDING_AMT)
FROM CUSTOMER
WHERE CUST_COUNTRY = "UK";

#List the top 5 biggest orders and ther proportion the advance amount was of the total order 
SELECT ORD_NUM
	,ADVANCE_AMOUNT/(ADVANCE_AMOUNT+ORD_AMOUNT)
FROM ORDERS
ORDER BY ORD_AMOUNT DESC
LIMIT 5;

#List the top 5 orders by the proportion the advance amount was of the total order 
SELECT ORD_NUM
	,ADVANCE_AMOUNT/(ADVANCE_AMOUNT+ORD_AMOUNT)
FROM ORDERS
ORDER BY ADVANCE_AMOUNT/(ADVANCE_AMOUNT+ORD_AMOUNT) DESC
LIMIT 5;

#List the number of customers each agent has. Order this from largetst to smallest
SELECT AGENT_CODE
	,COUNT(CUST_CODE)
FROM CUSTOMER
GROUP BY AGENT_CODE
ORDER BY COUNT(CUST_CODE) DESC;

#What customers have more than 1 order represented? List the number of orders each customer in descending order
SELECT CUST_CODE
	,COUNT(ORD_NUM)
FROM ORDERS
GROUP BY CUST_CODE
HAVING COUNT(ORD_NUM) >= 2
ORDER BY COUNT(ORD_NUM) DESC;
