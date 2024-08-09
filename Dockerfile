FROM prom/prometheus:v2.45.2

COPY prometheus.yml /etc/prometheus/prometheus.yml

# ARG TARGET_URL=https://keep-active-backend-v2.onrender.com/metrics
ARG TARGET_URL=http://localhost:8000/metrics

EXPOSE 9090

ENTRYPOINT ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--web.enable-lifecycle"]

# RUN DOCKER IMAGE
# sudo docker build -t appcrons-prometheus-image .
# sudo docker run -p 9090:9090 appcrons-prometheus-image
