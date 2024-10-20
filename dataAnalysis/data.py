import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns

# Read the CSV file
df = pd.read_csv('House Price Prediction Dataset.csv')

# Display the first 5 rows of the dataframe
print(df.head())

# Get information about the dataset (e.g., data types, non-null counts)
print(df.info())

# Get some basic statistics about the numeric columns
print(df.describe())

# Display the column names
print(df.columns)

# Check for null values in relevant columns
print(df[['Price', 'Condition', 'YearBuilt', 'Location']].isnull().sum())

# Handle null values (dropping rows with missing values in 'Price' or 'Condition' 'year built' or 'location')
df.dropna(subset=['Price', 'Condition', 'YearBuilt', 'Location'], inplace=True)

# Convert 'Condition' and 'location' to a categorical type if it's not already
df['Condition'] = df['Condition'].astype('category')
df['Location'] = df['Location'].astype('category')

# List unique locations
locations = df['Location'].unique()
print(f"Locations found: {locations}")

# **1. Filtering**: Get houses in good condition
good_condition = df[df['Condition'] == 'Good']
print("Houses in Good Condition:\n", good_condition)

# **2. Sorting**: Sort by price in descending order
sorted_by_price = df.sort_values(by='Price', ascending=False)
print("Sorted Houses by Price:\n", sorted_by_price.head())

# **3. Aggregating**: Average price by condition
average_price_by_condition = df.groupby('Condition')['Price'].mean().reset_index()
print("Average Price by Condition:\n", average_price_by_condition)

# **4. Counting**: Count of houses in each condition
count_by_condition = df['Condition'].value_counts().reset_index()
count_by_condition.columns = ['Condition', 'Count']
print("Count of Houses by Condition:\n", count_by_condition)

# Analysis 1: Price vs Condition for each location
for location in locations:
    plt.figure(figsize=(10, 6))
    sns.boxplot(x='Condition', y='Price', data=df[df['Location'] == location])
    plt.title(f'Price vs Condition in {location}')
    plt.xlabel('Condition')
    plt.ylabel('Price')
    plt.xticks(rotation=45)
    plt.show()

 # Correlation between Price and Condition for each location
    location_data = df[df['Location'] == location]
    location_data['Condition_Code'] = location_data['Condition'].cat.codes
    correlation_condition = location_data['Price'].corr(location_data['Condition_Code'])
    print(f'Correlation between Price and Condition in {location}: {correlation_condition:.2f}')

# Analysis 2: Price vs YearBuilt for each location
for location in locations:
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x='YearBuilt', y='Price', data=df[df['Location'] == location])
    plt.title(f'Price vs Year Built in {location}')
    plt.xlabel('Year Built')
    plt.ylabel('Price')
    plt.show()



    #: Add a regression line to the scatter plot
    plt.figure(figsize=(10, 6))
    sns.regplot(x='YearBuilt', y='Price', data=df[df['Location'] == location], scatter_kws={'s':10}, line_kws={'color':'red'})
    plt.title(f'Price vs Year Built with Regression Line in {location}')
    plt.xlabel('Year Built')
    plt.ylabel('Price')
    plt.show()

### Analysis 3: Floors vs Price group by location

# Scatter plot for Floors vs Price, grouped by location
for location in locations:
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x='Floors', y='Price', data=df[df['Location'] == location])
    plt.title(f'Floors vs Price in {location}')
    plt.xlabel('Floors')
    plt.ylabel('Price')
    plt.show()

    # Add a regression line to the scatter plot for each location
    plt.figure(figsize=(10, 6))
    sns.regplot(x='Floors', y='Price', data=df[df['Location'] == location], scatter_kws={'s':10}, line_kws={'color':'green'})
    plt.title(f'Floors vs Price with Regression Line in {location}')
    plt.xlabel('Floors')
    plt.ylabel('Price')
    plt.show()

# Box plot to compare Price distribution by Floors in each location
for location in locations:
    plt.figure(figsize=(10, 6))
    sns.boxplot(x='Floors', y='Price', data=df[df['Location'] == location])
    plt.title(f'Price Distribution by Floors in {location}')
    plt.xlabel('Floors')
    plt.ylabel('Price')
    plt.show()

    # Correlation between Floors and Price for each location
    location_data = df[df['Location'] == location]
    correlation_floors_price = location_data['Floors'].corr(location_data['Price'])
    print(f'Correlation between Floors and Price in {location}: {correlation_floors_price:.2f}')

  # Correlation between Price and YearBuilt for each location
    correlation_yearbuilt = location_data['Price'].corr(location_data['YearBuilt'])
    print(f'Correlation between Price and Year Built in {location}: {correlation_yearbuilt:.2f}')