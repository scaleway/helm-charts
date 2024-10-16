# Scaleway Cert-Manager Webhook

Deploys the scaleway cert-manager webhook.

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square) ![ChartVersion: 0.3.0](https://img.shields.io/badge/ChartVersion-0.3.0-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `scaleway-certmanager-webhook` use the following:

```sh
helm upgrade --install scaleway-certmanager-webhook .
```

## Parameters

### Configuration

Configuration parameters.

| Name                             | Description                                      | Value                     |
| -------------------------------- | ------------------------------------------------ | ------------------------- |
| `groupName`                      | Name under which the webhook will be available   | `acme.scaleway.com`       |
| `certManager.namespace`          | Namespace under which cert-manager is installed  | `cert-manager`            |
| `certManager.serviceAccountName` | Name of the cert-manager service account         | `cert-manager`            |
| `pki.caDuration`                 | Webhook ca duration                              | `43800h`                  |
| `pki.servingCertificateDuration` | Webhook certificate duration                     | `8760h`                   |
| `secret.accessKey`               | Default scaleway access key (optional)           | `""`                      |
| `secret.secretKey`               | Default scaleway secret key (optional)           | `""`                      |
| `secret.name`                    | Secret name for the default scaleway credentials | `scaleway-webhook-secret` |


### Common configuration

Common parameters.

| Name                     | Description                                                             | Value                                    |
| ------------------------ | ----------------------------------------------------------------------- | ---------------------------------------- |
| `nameOverride`           | Override charts name                                                    | `""`                                     |
| `fullnameOverride`       | Override charts and release name                                        | `""`                                     |
| `replicaCount`           | Number of replica                                                       | `1`                                      |
| `image.repository`       | Repository for the webhook image                                        | `scaleway/cert-manager-webhook-scaleway` |
| `image.pullPolicy`       | Image pull policy                                                       | `IfNotPresent`                           |
| `image.imagePullSecrets` | Image pull secrets                                                      | `[]`                                     |
| `image.tag`              | Tag for the webhook image, defaults to AppVersion                       | `""`                                     |
| `extraEnv`               | Additional environment variables to pass to the webhook deployment      | `[]`                                     |
| `service.type`           | Service type exposing the webhook                                       | `ClusterIP`                              |
| `service.port`           | Service port exposing the webhook                                       | `443`                                    |
| `listenPort`             | Port the webhook listens on                                             | `443`                                    |
| `service.ipFamilyPolicy` | Service ipFamilyPolicy set the ip family policy to configure dual-stack | `""`                                     |
| `service.ipFamilies`     | Service ipFamilies. Can be IPv4 and/or IPv6.                            | `[]`                                     |
| `resources`              | Resources definition                                                    | `{}`                                     |
| `podLabels`              | Pod labels                                                              | `{}`                                     |
| `nodeSelector`           | Node selector                                                           | `{}`                                     |
| `tolerations`            | Tolerations                                                             | `[]`                                     |
| `affinity`               | Affinities                                                              | `{}`                                     |
| `securityContext`        | Container securityContext                                               | `{}`                                     |
| `podSecurityContext`     | Pod securityContext                                                     | `{}`                                     |
