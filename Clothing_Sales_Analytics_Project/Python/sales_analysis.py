import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="December@123",
    database="clothingstoreanalytics"
)

query = """
SELECT
MONTH(o.OrderDate) AS Month,
SUM(s.TotalAmount) AS Revenue
FROM sales s
JOIN orders o
ON s.OrderID = o.OrderID
GROUP BY MONTH(o.OrderDate)
ORDER BY Month
"""

df = pd.read_sql(query, connection)

print("Database Connected Successfully!")
print(df)
plt.figure(figsize=(8,5))

sns.lineplot(
    data=df,
    x="Month",
    y="Revenue",
    marker="o"
)

plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")

plt.show()

connection.close()
