import cx_Oracle

# DB 접속
con = cx_Oracle.connect("scott", "TIGER", "localhost:1521/xe", encoding="UTF-8")
cursor = con.cursor()


# Insert (Write to DB)
in_data = "Hello World~ 안녕 오라클-파이썬"

for row in cursor.execute("select * from EMP"):
    print(row)


con.close()
