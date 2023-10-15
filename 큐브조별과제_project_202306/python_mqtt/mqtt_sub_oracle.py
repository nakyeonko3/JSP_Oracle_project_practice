import cx_Oracle
import paho.mqtt.client as mqtt
import time

#서버로부터 CONNTACK 응답을 받을 때 호출되는 콜백
def on_connect(client, userdata, flags, rc):
	print("Connected with result code "+str(rc))
	#client.subscribe("$SYS/#")
	client.subscribe("/sall") #"/test"토픽 구독 7번줄

#서버로부터 publish message를 받을 때 호출되는 콜백
def on_message(client, userdata, msg):
	#print(msg.topic+" "+str(msg.payload)) #토픽과 메세지를 출력한다.
	#print(msg.payload)
	#print(type(msg.payload))
	utf_data = msg.payload.decode("utf-8")
	data = utf_data .split(", ")
	#print(data[0])
	#print(data[1])
	#print(data[2])
	#cursor.execute("insert into Sensors (IDX, VAL1,VAL2,VAL3,VAL4,VAL5,VAL6,VAL7,VAL8,VAL9,VAL10, REC) values (s_seq.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, SYSDATE)", [1,2,3,4,5,6,7,8,9,10])
	cursor.execute("insert into Sensors (IDX, VAL1,VAL2,VAL3, REC) values (s_seq.NEXTVAL, :1, :2, :3, SYSDATE)", [float(data[0]), float(data[1]), float(data[2]) ])
	con.commit()

	cursor.execute("select * from Sensors order BY IDX DESC")
	out_data = cursor.fetchone()
	print("=====>", out_data)
	#rows = cursor.fetchall()
	#if rows:
	#    for row in rows:
	#        print(row)
 
	#con.close()

broker_address="192.168.0.209"
print("creating new instance")
client = mqtt.Client() #client 오브젝트 생성

con = cx_Oracle.connect("scott", "tiger", "192.168.0.132:1521/xe", encoding="UTF-8")
cursor = con.cursor()

client.on_connect = on_connect #콜백설정
client.on_message = on_message #콜백설정
client.username_pw_set("user2", "password2")
print("connecting to broker")

client.connect(broker_address) #connect to broker

client.loop_forever()