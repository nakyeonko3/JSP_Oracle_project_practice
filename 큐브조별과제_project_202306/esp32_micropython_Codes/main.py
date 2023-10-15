# main.py
import network,time
from simple import MQTTClient
import ubinascii
import machine
from machine import I2C,Pin,Timer
from ssd1306 import SSD1306_I2C
import dht,time

i2c = I2C(sda=Pin(13), scl=Pin(14))
oled = SSD1306_I2C(128, 64, i2c, addr=0x3c)

d = dht.DHT11(Pin(27)) #传感器连接到引脚15
time.sleep(1)   #首次启动停顿1秒让传感器稳定

ssid = 'kiptime'
password = '12345678k'
mqtt_server = 'broker.hivemq.com'
#client_id = ubinascii.hexlify(machine.unique_id())
#topic_pub_temp = b'esp/ds18b20/temperature’

last_message = 0
message_interval = 3

def WIFI_Connect():

    WIFI_LED=Pin(2, Pin.OUT) #初始化WIFI指示灯

    wlan = network.WLAN(network.STA_IF) #STA模式
    wlan.active(True)                   #激活接口
    start_time=time.time()              #记录时间做超时判断

    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect(ssid, password) #输入WIFI账号密码

        while not wlan.isconnected():

            #LED闪烁提示
            WIFI_LED.value(1)
            time.sleep_ms(300)
            WIFI_LED.value(0)
            time.sleep_ms(300)

            if time.time()-start_time > 15 :
                print('WIFI Connected Timeout!')
                break

    if wlan.isconnected():
        #LED点亮
        WIFI_LED.value(1)

        #串口打印信息
        print('network information:', wlan.ifconfig())

        #OLED数据显示（如果没接OLED，请将下面代码屏蔽）
        oled.fill(0)   #清屏背景黑色
        oled.text('IP/Subnet/GW:',0,0)
        oled.text(wlan.ifconfig()[0], 0, 20)
        oled.text(wlan.ifconfig()[1],0,38)
        oled.text(wlan.ifconfig()[2],0,56)
        oled.show()
        return True

    else:
        return False



def restart_and_reconnect():
  print('Failed to connect to MQTT broker. Reconnecting...')
  time.sleep(10)
  machine.reset()

def read_sensor():
  try:
    d.measure()         #温湿度采集

   #OLED显示温湿度
    oled.fill(0) #清屏背景黑色
    oled.text('01Studio', 0, 0)
    oled.text('DHT11 test:',0,15)
    temp = str(d.temperature())+' C'
    humi = str(d.humidity())+' %'
    oled.text(temp,0,40)   #温度显示
    oled.text(humi,48,40)  #湿度显示
    oled.show()    
    return temp, humi    
  except OSError as e:
    return('Failed to read sensor.')



if WIFI_Connect():
    SERVER = mqtt_server
    PORT = 1883
    CLIENT_ID = '01Studio-ESP32'
    TOPIC1 = 't1'
    TOPIC2 = 'h1'
    TOPIC3 = 'th'

    client = MQTTClient(CLIENT_ID, SERVER, PORT) #建立客户端对象
    #client.set_callback(MQTT_callback)  #配置回调函数
    client.connect()
    #client.subscribe(TOPIC) #订阅主题

    while True:
      try:
        if (time.time() - last_message) > message_interval:
          temp, humi = read_sensor()
          print(temp, humi)
          client.publish(TOPIC1, temp)
          client.publish(TOPIC2, humi)
          client.publish(TOPIC3, temp+':'+humi)
          last_message = time.time()
      except OSError as e:
        restart_and_reconnect()

