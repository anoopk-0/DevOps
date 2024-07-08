# Monitoring a Kubernetes Cluster:


Metrics to Monitor:

1. Node Level Metrics:
   - Number of nodes in the cluster.
   - Health status of each node.
   - Resource utilization metrics such as CPU, memory, network, and disk usage.

2. Pod Level Metrics:
   - Number of pods running in the cluster.
   - Resource consumption metrics of each pod, including CPU and memory usage.

--

## Monitoring Solutions Available:

- Kubernetes does not natively provide a comprehensive monitoring solution out-of-the-box.
- Recommended open source solutions:
  - `Metrics Server`: Basic in-memory solution that aggregates metrics from nodes and pods. Ideal for simple monitoring needs.
  - `Prometheus`: Powerful open-source monitoring and alerting toolkit designed for Kubernetes. Provides extensive metrics collection and querying capabilities.
  - `Elastic Stack`: Elasticsearch, Logstash, and Kibana (ELK stack) can be used for log aggregation and visualization alongside metrics.
- Proprietary solutions like Datadog and Dynatrace offer advanced features including automated monitoring, alerts, and analytics.

Metrics Server Overview:

- Formerly known as Hipster, now streamlined into Metrics Server.
- Operates in-memory and does not persist metrics to disk.
- Collects metrics via the kubelet's cAdvisor (Container Advisor) component from each node's pods.

Deployment:

- Minikube: Enable Metrics Server using `minikube addons enable metrics-server`.
- Other Environments: Deploy Metrics Server by cloning its deployment files from GitHub and using `kubectl create` to deploy required components.

Usage:

- After deployment, allow Metrics Server time to gather and process data.
- View cluster-wide performance:
  - Use `kubectl top node` to check CPU and memory consumption per node.
  - Use `kubectl top pod` to view metrics for individual pods.

Conclusion:

Monitoring Kubernetes is crucial for maintaining cluster health and optimizing resource utilization. While Metrics Server provides basic insights, consider advanced solutions like Prometheus for more comprehensive monitoring needs.
