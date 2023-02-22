# EasyDeploy - cron helm chart

This chart offers the following features:

* Deploy a cronjob on Kubernetes through helm.
* Cron feature of the Kapsule EasyDeploy web interface

## Prerequisites Details

* Kubernetes 1.21+
* Helm 3+

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release .
```

## Configuration

The following table lists the configurable parameters of the chart and their default values:

| Parameter               | Description                        | Default                                       |
| ----------------------- | ---------------------------------- | --------------------------------------------- |
| `image`                 | Docker image to use                | `hello-world:latest`                          |
| `command`               | Override container entry point     | `""`                                          |
| `args`                  | Override container arguments       | `[]`                                          |
| `environments`          | Container environment variables    | `[]` (see bellow)                             |
| `scheduleminute`        | Cron minute (0-59)                 | `0`                                           |
| `schedulehour`          | Cron hour (0-23)                   | `*`                                           |
| `schedulemonthday`      | Cron day of month (1-31)           | `*`                                           |
| `schedulemonth`         | Cron month (1-12)                  | `*`                                           |
| `scheduleweekday`       | Cron day of week (0-7)             | `*`                                           |

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
