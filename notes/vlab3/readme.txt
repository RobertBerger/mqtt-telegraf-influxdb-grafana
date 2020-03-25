sudo apt install mosquitto-clients

mosquitto_sub -h mqttbrk1.int.vlab3.dyndns.org -t tele/# -v

# This is the sensor on top of the air condition

mosquitto_sub -h mqttbrk1.int.vlab3.dyndns.org -t tele/line/lamp1/SENSOR -v
tele/line/lamp1/SENSOR {"Time":"2020-03-25T11:47:25","AM2301":{"Temperature":23.1,"Humidity":14.0},"TempUnit":"C"}

try this:
tele/line/lamp1/SENSOR


mosquitto_sub -h mqttbrk1.int.vlab3.dyndns.org -t tele/line/lamp1/# -v
tele/line/lamp1/LWT Offline
tele/line/lamp1/LWT Online
tele/line/lamp1/INFO1 {"Module":"Sonoff TH","Version":"7.1.2(tasmota)","FallbackTopic":"cmnd/DVES_44B0A0_fb/","GroupTopic":"cmnd/tasmotas/"}
tele/line/lamp1/INFO2 {"WebServerMode":"Admin","Hostname":"line/lamp1/-4256","IPAddress":"192.168.5.67"}
tele/line/lamp1/INFO3 {"RestartReason":"Fatal exception:29 flag:2 (EXCEPTION) epc1:0x4000df64 epc2:0x00000000 epc3:0x00000000 excvaddr:0x00000000 depc:0x00000000"}
tele/line/lamp1/STATE {"Time":"2020-03-25T20:32:43","Uptime":"0T00:00:13","UptimeSec":13,"Heap":28,"SleepMode":"Dynamic","Sleep":50,"LoadAvg":19,"MqttCount":1,"POWER":"OFF","Wifi":{"AP":1,"SSId":"TP-Link_50DF","BSSId":"98:DA:C4:5B:50:DF","Channel":3,"RSSI":88,"LinkCount":1,"Downtime":"0T00:00:07"}}
tele/line/lamp1/SENSOR {"Time":"2020-03-25T20:32:43","AM2301":{"Temperature":22.6,"Humidity":14.9},"TempUnit":"C"}

try this:

tele/line/rack/STATE
tele/line/rack/SENSOR

# This is the sensor at the bottom of the rack
mosquitto_sub -h mqttbrk1.int.vlab3.dyndns.org -t tele/ups/conserver1/SENSOR -v

try this:

tele/ups/conserver1/SENSOR

# This is the main power


---

https://grafanarber.vlab3.dyndns.org/

admin/admin

changed admin pw:

radmin

---

figure out which databases we have - if any

cd ~/projects/mqtt-telegraf-influxdb-grafana
docker-compose exec influxdb sh

# influx -precision rfc3339
Connected to http://localhost:8086 version 1.7.10
InfluxDB shell version: 1.7.10
> SHOW DATABASES
name: databases
name
----
vm_metrics
docker_metrics
_internal
> USE vm_metrics
Using database vm_metrics
> SELECT * FROM /.*/ LIMIT 1
name: cpu_vm
time                 AM2301_Humidity AM2301_Temperature active available available_percent buffered cached commit_limit committed_as cpu       device dirty free fstype high_free high_total host             huge_page_size huge_pages_free huge_pages_total in inactive load1 load15 load5 low_free low_total mapped mode n_cpus n_users out page_tables path shared slab sreclaimable sunreclaim swap_cached swap_free swap_total topic total uptime uptime_format usage_guest usage_guest_nice usage_idle         usage_iowait      usage_irq usage_nice usage_softirq        usage_steal usage_system       usage_user        used used_percent vmalloc_chunk vmalloc_total vmalloc_used wired write_back write_back_tmp
----                 --------------- ------------------ ------ --------- ----------------- -------- ------ ------------ ------------ ---       ------ ----- ---- ------ --------- ---------- ----             -------------- --------------- ---------------- -- -------- ----- ------ ----- -------- --------- ------ ---- ------ ------- --- ----------- ---- ------ ---- ------------ ---------- ----------- --------- ---------- ----- ----- ------ ------------- ----------- ---------------- ----------         ------------      --------- ---------- -------------        ----------- ------------       ----------        ---- ------------ ------------- ------------- ------------ ----- ---------- --------------
2020-03-25T01:49:30Z                                                                                                                 cpu-total                                               s5-kvm-grafana-1      

----

Add data source

Add a data source, that is the displayed data source information. Select the InfluxDB type data source and enter the connection parameters to configure it.

add the image 01 here

----

New Dashboard

+ -> Create -> Dashboard -> Add Query

There are four steps required to create a panel, Queries, Visualization, General (chart configuration), Alert, and complete the following creation process following the business requirements :







