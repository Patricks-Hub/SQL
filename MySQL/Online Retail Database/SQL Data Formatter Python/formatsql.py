import os

def format_customer_data(input_file, output_file, table_name):
    """
    Reads csv data from input_file, formats each line, and writes to output_file
    Adds an SQL INSERT INTO statement at the beginning.
    Format: INSERT INTO <table_name> VALUES (...), (...);
    """
    # Create output directory if it doesn't exist
    output_dir = os.path.dirname(output_file)
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # Skip header if exists
        header = infile.readline()
        
        # Read all lines into a list
        lines = [line.strip() for line in infile if line.strip()]
        
        # Format all lines into a single string
        formatted_lines = ""
        for i, line in enumerate(lines):
            if i < len(lines) - 1:
                formatted_lines += f"({line}),"
            else:
                formatted_lines += f"({line})"  # No trailing comma for the last line
        
        # Add the SQL INSERT INTO statement
        insert_statement = f"INSERT INTO {table_name} VALUES\n"
        outfile.write(insert_statement + formatted_lines + ";")
    
    print(f"Successfully formatted data with SQL INSERT statement. Output saved to: {output_file}")

# Update the input and output file paths as needed
input_path = r'C:\College Work\Personal Projects\Online Retail Database\Raw Data\customer.csv'  # Replace with your actual input file path
output_path = r'C:\College Work\Personal Projects\Online Retail Database\Raw Data\customer.sql'  # Replace with your actual output file path
table_name = "customers"  # Replace with your actual table name

format_customer_data(input_path, output_path, table_name)