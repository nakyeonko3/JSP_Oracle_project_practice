import cx_Oracle

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="XE")
con = cx_Oracle.connect("scott", "TIGER", dsn, encoding="UTF-8")

cursor = con.cursor()
cursor.execute("SELECT * FROM EMP")

results = cursor.fetchall()
print(results[0][4].year)
print(results[0][4].month)
print(results[0][4].day)
