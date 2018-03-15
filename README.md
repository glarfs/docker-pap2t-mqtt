# docker-pap2t-mqtt

Scrapps PAP2T device and publishes phone status and last_caller_id to mqtt


# Buils

```
docker build -t glarfs/pap2t-mqtt .
```

# Run

```

docker run -e PAP2T_MQTT_HOST=x.x.x.x -e PAP2T_MQTT_PORT=1883 -e PAP2T_MQTT_ENTRYPOINT=/my/phone -e PAP2T_HOST=x.x.x.y glafs/pap2t-mqtt
```


