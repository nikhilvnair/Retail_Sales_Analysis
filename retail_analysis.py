
import pandas as pd

# Load the dataset
df = pd.read_excel("Sample-Superstore.xlsx")

# Clean column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# Total KPIs
print("Total Sales:", round(df['sales'].sum(), 2))
print("Total Orders:", df['order_id'].nunique())
print("Total Customers:", df['customer_id'].nunique())
print("Total Products:", df['product_id'].nunique())

# Sales & Profit by Ship Mode
ship_mode_summary = df.groupby('ship_mode')[['sales', 'profit']].sum().round(2)
print("\nSales & Profit by Ship Mode:\n", ship_mode_summary)

# Sales & Profit by Segment
segment_summary = df.groupby('segment')[['sales', 'profit']].sum().round(2)
print("\nSales & Profit by Segment:\n", segment_summary)

# Sales by Region with Percentage
region_sales = df.groupby('region')['sales'].sum()
region_sales_percent = 100 * region_sales / region_sales.sum()
region_summary = pd.concat([region_sales.round(2), region_sales_percent.round(2)], axis=1)
region_summary.columns = ['total_sales', 'percentage']
print("\nSales by Region with Percentage:\n", region_summary)

# Sales & Profit by Category
category_summary = df.groupby('category')[['sales', 'profit']].sum().round(2)
print("\nSales & Profit by Category:\n", category_summary)

# Sales by State
state_summary = df.groupby('state')['sales'].sum().round(2).sort_values(ascending=False)
print("\nSales by State:\n", state_summary)

# Sales by Sub-Category
subcategory_summary = df.groupby('sub_category')['sales'].sum().round(2).sort_values(ascending=False)
print("\nSales by Sub-Category:\n", subcategory_summary)
