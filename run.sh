#!/bin/bash

set -e

CONFIG_PATH=/data/options.json

API_KEY=$(jq --raw-output ".API_KEY" $CONFIG_PATH)
APP_KEY=$(jq --raw-output ".APP_KEY" $CONFIG_PATH)
MQTT_USER=$(jq --raw-output ".MQTT_USER" $CONFIG_PATH)
MQTT_PASSWORD=$(jq --raw-output ".MQTT_PASSWORD" $CONFIG_PATH)
MQTT_BROKER_ADDRESS=$(jq --raw-output ".MQTT_BROKER_ADDRESS" $CONFIG_PATH)

echo > /app/.env
echo API_KEY=$API_KEY >> /app/.env
echo APP_KEY=$APP_KEY >> /app/.env
echo MQTT_USER=$MQTT_USER >> /app/.env
echo MQTT_PASSWORD=$MQTT_PASSWORD >> /app/.env
echo MQTT_BROKER_ADDRESS=$MQTT_BROKER_ADDRESS >> /app/.env

cd /app

exec npm start