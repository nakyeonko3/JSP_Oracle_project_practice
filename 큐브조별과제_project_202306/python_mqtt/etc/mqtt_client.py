import paho.mqtt.client as mqtt
import json

TOPIC1 = "t1"
TOPIC2 = "h2"
TOPIC3 = "th"
# HOSTNAME = "localhost"
HOSTNAME = "broker.hivemq.com"


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("connected OK")
    else:
        print("Bad connection Returned code=", rc)


def on_disconnect(client, userdata, flags, rc=0):
    print(str(rc))


def on_subscribe(client, userdata, mid, granted_qos):
    print("subscribed: " + str(mid) + " " + str(granted_qos))


def on_message(client, userdata, msg):
    data = str(msg.payload.decode("utf-8"))
    json_dict = json.loads(data)
    print(f"value:{json_dict['value']}")
    print(f"time:{json_dict['time']}")
    	cursor.execute("insert into Sensors (IDX, VAL1,VAL2,VAL3, REC) values (s_seq.NEXTVAL, :1, :2, :3, SYSDATE)", [float(data[0]), float(data[1]), float(data[2]) ])



client = mqtt.Client()

# 콜백 함수 설정 on_connect(브로커에 접속), on_disconnect(브로커에 접속중료)
# on_subscribe(topic 구독)
client.on_connect = on_connect
client.on_disconnect = on_disconnect
client.on_subscribe = on_subscribe
client.on_message = on_message

client.connect(HOSTNAME, 1883)

client.subscribe(TOPIC1, 1)
client.loop_forever()
