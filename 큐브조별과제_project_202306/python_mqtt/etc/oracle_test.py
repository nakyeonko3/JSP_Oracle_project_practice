import cx_Oracle


#####################################################################################################
# DB 접속
#####################################################################################################
con = cx_Oracle.connect("scott", "TIGER", "localhost:1521/xe", encoding="UTF-8")
cursor = con.cursor()


#####################################################################################################
# Insert (Write to DB)
#####################################################################################################
in_data = "Hello World~ 안녕 오라클-파이썬"
cursor.execute(
    "insert into Sensors (IDX, VAL1,VAL2,VAL3,VAL4,VAL5,VAL6,VAL7,VAL8,VAL9,VAL10, REC) values (s_seq.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, SYSDATE)",
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
)
con.commit()


#####################################################################################################
# Select (Read from DB)
#####################################################################################################
cursor.execute("select * from Sensors")
# out_data = cursor.fetchone()
# print("=====>", out_data[0])
rows = cursor.fetchall()
if rows:
    for row in rows:
        print(row)

con.close()
