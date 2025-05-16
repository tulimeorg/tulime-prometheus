# TULIME MONITORING USING PROMETHEUS

## Overview

This guide provides instructions on setting up Prometheus in a Docker container to scrape metrics from tulime backend via url that maybe local or hosted

## Prerequisites

- Docker installed on your system
- Basic understanding of Prometheus and Docker concepts

## Steps to run prometheus server locally

### 1. clone this repository

```sh

git clone https://github.com/tulimeorg/tulime-prometheus.git
cd tulime-prometheus

```

### 2. Specify target url

In the file prometheus.yml, specify the server url from which the prometheus should scrape metrics. Please note that server must be running the prometheus client responsible for collecting the metrics.

```yml
global:
  scrape_interval: 5s
  # scrape_interval: 15s

scrape_configs:
  - job_name: "custom_metrics"
    static_configs:
      - targets: ["your-server-url/metrics"]
```

### 3. Build and run docker to image to start prometheus server

Run the commands below in the root of the project to build and run the prometheus server

```sh
docker build -t my-prometheus-image .

docker run -p 9090:9090 my-prometheus-image

```

## For Additional Information checkout the docs

- [Prometheus documentation](https://prometheus.io/docs/introduction/overview/)
- [Docker documentation](https://docs.docker.com/)
