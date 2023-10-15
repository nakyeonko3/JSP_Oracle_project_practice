from fastapi import FastAPI
import cx_Oracle

app = FastAPI()

# 데이터베이스 연결 설정
dsn = cx_Oracle.makedsn("localhost", 1521, service_name="XE")
pool = cx_Oracle.SessionPool(
    user="scott",
    password="TIGER",
    dsn=dsn,
    min=1,
    max=20,
    increment=1,
    encoding="UTF-8",
)


@app.get("/")
def read_root():
    return {"Hello": "hi nakyeon ko"}


@app.on_event("startup")
async def startup():
    await pool.acquire()


@app.on_event("shutdown")
async def shutdown():
    await pool.close()


@app.get("/users")
def get_users():
    connection = pool.acquire()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM users")
    results = cursor.fetchall()
    pool.release(connection)
    return results
