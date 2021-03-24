# EasyDeploy - deployment helm chart

This chart offers the following features:

* Deploy a simple application on Kubernetes through helm.
* Deployment feature of the Kapsule EasyDeploy web interface

## Prerequisites Details
* Kubernetes 1.10+
* Helm 3+

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release .
```

## Configuration

The following table lists the configurable parameters of the consul chart and their default values.

| Parameter               | Description                        | Default                                                    |
| ----------------------- | ---------------------------------- | ---------------------------------------------------------- |
| `image`                 | Container image to use             | `nginxdemos/hello:plain-text`                              |
| `command`               | Override container entrypoint      | `""`                                                       |
| `args`                  | Override container arguments       | `[]`                                                       |
| `environments`          | Container environment variables    | `[]` (see bellow)                                          |
| `ports`                 | Ports exposed by container         | `[80]`                                                     |
| `loadbalancer`          | Container environment variables    | `false`                                                    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f overridevalues.yaml .
```

> **Tip**: `environments` is an array of objects with `name` and `value` keys.

```yaml
environments:
  - name: TEST
    value: Content
  - name: DEBUG
    value: "true"
```
