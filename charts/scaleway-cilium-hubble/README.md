# Scaleway Cilium Hubble

This charts deploys Hubble as an add-on to Scaleway Kubernetes clusters.

> This chart MUST be deployed in the `kube-system` namespace !

## Requirements

* Scaleway Kubernetes cluster >= 1.31.0
* Cilium CNI selected upon cluster creation

## Installation

To add the Scaleway Helm repository and install the chart from there, use the following commands:

```sh
helm repo add scaleway https://helm.scw.cloud/
helm repo update
helm -n kube-system upgrade --install scaleway-cilium-hubble scaleway/scaleway-cilium-hubble
```

You'll then need to rollout cilium agents to load the new configuration:

```sh
kubectl -n kube-system rollout restart daemonset cilium
```

> You can check the rollout progress using `kubectl -n kube-system rollout status daemonset cilium`

## Configuration

The following table lists the configurable parameters of the Scaleway Cilium Hubble chart and their default values.

| Parameter                                     | Description                                                                                                                                                                                               | Default Value                          |
|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| `nodeConfig.enable-hubble`                    | Enable Hubble gRPC service.                                                                                                                                                                               | `"true"`                               |
| `nodeConfig.hubble-socket-path`               | UNIX domain socket for Hubble server to listen to.                                                                                                                                                        | `"/var/run/cilium/hubble.sock"`        |
| `nodeConfig.hubble-event-buffer-capacity`     | Capacity of the buffer to store recent events.                                                                                                                                                            | `"32767"`                              |
| `nodeConfig.hubble-metrics-server`            | Address to expose Hubble metrics (e.g. ":7070"). Metrics server will be disabled if this field is not set.                                                                                                | `":9965"`                              |
| `nodeConfig.hubble-metrics-server-enable-tls` | Enable or disable TLS for Hubble metrics server.                                                                                                                                                          | `"false"`                              |
| `nodeConfig.hubble-metrics`                   | A space separated list of metrics to enable.                                                                                                                                                              | see `values.yaml` for the default list |
| `nodeConfig.enable-hubble-open-metrics`       | Enable or disable Hubble OpenMetrics.                                                                                                                                                                     | `"false"`                              |
| `nodeConfig.hubble-export-file-max-size-mb`   | Maximum size of the Hubble export file in MB.                                                                                                                                                             | `"10"`                                 |
| `nodeConfig.hubble-export-file-max-backups`   | Maximum number of backups for the Hubble export file.                                                                                                                                                     | `"5"`                                  |
| `nodeConfig.hubble-listen-address`            | An additional address for Hubble server to listen to (e.g. ":4244").                                                                                                                                      | `":4244"`                              |
| `networkPolicies.enabled`                     | Add network policies to allow the network traffic that Hubble Relay and Hubble UI need to function. This makes sure Hubble works in case you have a deny-all network policy in place on your K8s cluster. | `false`                                |

For other parameters, refer to cilium's own chart documentation under the `cilium` top level key.

> Make sure **NOT** to enable the `operator`/`envoy`/`agent` as it will break the managed `cilium`.

## Usage

Once the chart is installed, you can forward Hubble UI to the local machine:

```sh
kubectl -n kube-system port-forward svc/hubble-ui 12000:80
```

Then open Hubble UI in a browser at `http://localhost:12000`
