# Kubernetes Cloud Controller Manager Helm Chart

`scaleway-cloud-controller-manager` is the Kubernetes cloud controller manager implementation
(or out-of-tree cloud-provider) for Scaleway.

**WARNING**: Do not install it on Kapsule, this componant is already installed on scaleway side.

## Installing

### Prerequisites

* Helm 3+
* On premise Kubernetes cluster (kubeadm, kops, kubespray...)

Add Scaleway chart repository to Helm:

```bash
helm repo add scaleway https://helm.scw.cloud/
```

Then, update chart indexes:

```bash
helm repo update
```

### Deploying the cloud controller manager

To install the chart with the release name `ccm`:

```bash
$ helm install --name ccm scaleway/scaleway-cloud-controller-manager \
  --set scaleway.access_key="MY-ACCESS-KEY" \
  --set scaleway.secret_key="MY-SECRET-KEY" \
  --set scaleway.default_project_id="CLUSTER-PROJECT-ID" \
  --set scaleway.default_region="fr-par"
```

## Configuration

The following table lists the configurable parameters of the scaleway-cloud-controller-manager chart and their default values.

Parameter | Description | Default
--- | --- | ---
`scaleway.access_key` | Scaleway access key      | `""`
`scaleway.secret_key` | Scaleway secret key      | `""`
`scaleway.default_project_id` | Scaleway project id      | `""`
`scaleway.default_region` | Scaleway region          | `""`
`image.repository` | container image repository         | `scaleway/scaleway-cloud-controller-manager`
`image.pullPolicy` | container image pull policy        | `IfNotPresent`
`image.tag` | container image tag to use         | `""`
`secret.create` | if true, creates a secret with provided scaleway credentials | `true`
`secret.name` | override default secret name or provide an external secret to use | `""`
`serviceAccount.create` | if true, creates a service account with required accesses | `true`
`serviceAccount.annotations` | annotations to be added to the service account | `{}`
`serviceAccount.name` | override default service account name or provide an external service account to use | `""`
`resources.requests.cpu` | cpu reservation | `100m`
`resources.requests.memory` | memory reservation | `50Mi`
`nodeSelector` | node labels for pod assignment | `{}`
`tolerations` | node taints to tolerate | `[]`
`affinity` | node/pod affinities | `{}`

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies values for the parameters can be provided while installing the chart:

```bash
$ helm install --name ccm -f overridevalues.yaml scaleway/scaleway-cloud-controller-manager
```

```yaml
scaleway:
  access_key: "MY-ACCESS-KEY"
  secret_key: "MY-SECRET-KEY"
  default_project_id: "CLUSTER-PROJECT-ID"
  default_region: "fr-par"
```
