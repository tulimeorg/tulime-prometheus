FROM prom/prometheus:v2.54.0

COPY prometheus.yml /etc/prometheus/prometheus.yml

# ARG TARGET_URL=https://pi.tuliime.com/metrics
ARG TARGET_URL=http://127.0.0.1:8000/metrics

EXPOSE 9090

ENTRYPOINT ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--web.enable-lifecycle"]

# RUN DOCKER IMAGE
# sudo docker build -t tuliime-prometheus-image .

# LOCAL ENVIRONMENT
#  sudo docker run --network="host" \
#     -p 9090:9090 \
#     -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
#     -v prometheus-data:/prometheus \
#     tuliime-prometheus-image


#  sudo docker run \
#     -p 9090:9090 \
#     -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
#     -v prometheus-data:/prometheus \
#     prom/prometheus

