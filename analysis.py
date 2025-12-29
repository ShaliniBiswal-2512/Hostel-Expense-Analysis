import mysql.connector
import pandas as pd

conn = mysql.connector.connect(
    host="localhost",
    user="root",          
    password="IT2206376",
    database="hostel_db"
)

query = "SELECT * FROM expenses;"
df = pd.read_sql(query, conn)

print(df.head())

total_expense = df['amount'].sum()
print("Total Expense:", total_expense)

category_expense = df.groupby('expense_type')['amount'].sum()
print(category_expense)

payment_expense = df.groupby('payment_mode')['amount'].sum()
print(payment_expense)

import matplotlib.pyplot as plt

category_expense.plot(kind='bar')
plt.title("Category-wise Expenses")
plt.xlabel("Expense Type")
plt.ylabel("Amount")
plt.tight_layout()
plt.show()

payment_expense.plot(kind='pie', autopct='%1.1f%%')
plt.title("Payment Mode Distribution")
plt.ylabel("")
plt.show()

