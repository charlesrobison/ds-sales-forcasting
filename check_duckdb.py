import duckdb

# Connect to your local dev.duckdb file
con = duckdb.connect("dev.duckdb")

print("\n=== Tables in dev.duckdb ===")
tables = con.execute("SHOW TABLES").fetchall()
for t in tables:
    print("-", t[0])

print("\n=== Schemas (from information_schema) ===")
schemas = con.execute("SELECT schema_name FROM information_schema.schemata").fetchall()
for s in schemas:
    print("-", s[0])

print("\n=== Preview sales_data (if it exists) ===")
try:
    df = con.execute("SELECT * FROM sales_data LIMIT 5").fetchdf()
    print(df)
except Exception as e:
    print("Could not preview sales_data:", e)

con.close()
