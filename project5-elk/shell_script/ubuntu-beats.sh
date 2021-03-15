#!/bin/bash -x

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.2-amd64.deb
sudo dpkg -i filebeat-7.11.2-amd64.deb

cat <<EOF > /etc/filebeat/filebeat.yml
filebeat.inputs:
- type: log
  enabled: false
  paths:
    - /var/log/*.log
    - /var/log/syslog
filebeat.config.modules:
  path: \${path.config}/modules.d/*.yml
  reload.enabled: false
setup.template.settings:
  index.number_of_shards: 1
setup.kibana:
  host: "localhost:5601"
output.elasticsearch:
  hosts: ["localhost:9200"]
  username: "elastic"
  password: "changeme"
processors:
  - add_host_metadata: ~
  - add_cloud_metadata: ~
  - add_docker_metadata: ~
  - add_kubernetes_metadata: ~
EOF


curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.11.2-amd64.deb
sudo dpkg -i metricbeat-7.11.2-amd64.deb 

cat <<EOF > /etc/metricbeat/metricbeat.yml

metricbeat.modules:
- module: system
  metricsets:
    - cpu             # CPU usage
    - load            # CPU load averages
    - memory          # Memory usage
    - network         # Network IO
    - process         # Per process metrics
    - process_summary # Process summary
    - uptime          # System Uptime
    - socket_summary  # Socket summary
    - core           # Per CPU core usage
    - diskio         # Disk IO
    - filesystem     # File system usage for each mountpoint
    - fsstat         # File system summary metrics
    - raid           # Raid
    - socket         # Sockets and connection info (linux only)
    - service        # systemd service information
  enabled: true
  period: 10s
  processes: ['.*']

  # Configure the metric types that are included by these metricsets.
  cpu.metrics:  ["percentages","normalized_percentages"]  # The other available option is ticks.
  core.metrics: ["percentages"]  # The other available option is ticks.
EOF
