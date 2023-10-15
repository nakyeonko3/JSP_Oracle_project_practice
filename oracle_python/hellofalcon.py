from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates

from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import cx_Oracle

app = FastAPI()
templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")

# 데이터베이스 연결 설정
dsn = cx_Oracle.makedsn("localhost", 1521, service_name="XE")
con = cx_Oracle.connect("scott", "TIGER", dsn, encoding="UTF-8")
cursor = con.cursor()


@app.get("/")
def read_root(request: Request):
    return templates.TemplateResponse(
        "index.html", {"request": request, "name": "nakyeon ko"}
    )


@app.get("/employees")
def get_employees():
    cursor.execute("SELECT * FROM EMP")
    results = cursor.fetchall()
    return results


@app.post("/employees")
def create_employee(name: str):
    cursor.execute("INSERT INTO EMP (ENAME) VALUES (:name)", name=name)
    con.commit()
    return {"message": "Employee created successfully"}


@app.on_event("shutdown")
def shutdown():
    cursor.close()
    con.close()


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("hellofalcon:app", host="127.0.0.1", port=8000, reload=True)
