import paho.mqtt.client as mqtt
import json
import time
import random
import datetime


TOPIC1 = "t1"
TOPIC2 = "h2"
TOPIC3 = "th"
# HOSTNAME = "localhost"
HOSTNAME = "broker.hivemq.com"


def get_time():
    now = datetime.datetime.now()
    now_format = now.strftime("%X")
    return now_format


def random_value():
    return {"value": random.randint(30, 40), "time": get_time()}


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("connected OK")
    else:
        print("Bad connection Returned code=", rc)


def on_message(client, userdata, message):
    message_str = str(message.payload.decode("utf-8"))
    print(f"received:{message_str} topic:{message.topic}")


def on_disconnect(client, userdata, flags, rc=0):
    print(str(rc))


def on_publish(client, userdata, mid):
    print("In on_pub callback mid= ", mid)


client = mqtt.Client()
client.on_connect = on_connect
client.on_disconnect = on_disconnect
client.on_publish = on_publish
client.on_message = on_message


client.connect(HOSTNAME, 1883)
client.loop_start()

client.subscribe(TOPIC1)
# client.publish(TOPIC, json.dumps(random_value()), 1)

while 1:
    client.publish(TOPIC1, json.dumps(random_value()), 1)
    time.sleep(1)

client.loop_stop()

client.disconnect()
