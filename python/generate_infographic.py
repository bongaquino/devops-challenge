import pandas as pd
import matplotlib.pyplot as plt

# Define the file paths
csv_file_path = '../pipeline_job_summary.csv'
output_image_path = '../pipeline_job_summary.jpg'

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(csv_file_path)

# Aggregate the data by status
status_counts = df.groupby('Status')['Occurrences'].sum()

# Generate the pie chart
plt.figure(figsize=(8, 8))
plt.pie(status_counts, labels=status_counts.index, autopct='%1.1f%%', startangle=140, colors=['#4CAF50', '#FF9800', '#F44336'])

# Set the title
plt.title('Pipeline Job Status Distribution')

# Save the pie chart as an image
plt.savefig(output_image_path, format='jpg')

print(f"Pipeline job summary infographic saved to {output_image_path}")
