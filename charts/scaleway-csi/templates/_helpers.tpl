{{/*
Expand the name of the chart.
*/}}
{{- define "scaleway-csi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scaleway-csi.deploymentfullname" -}}
{{- if .Values.deployment.fullNameOverride }}
{{- .Values.deployment.fullNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-controller" .Release.Name  | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-controller" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "scaleway-csi.daemonsetfullname" -}}
{{- if .Values.daemonset.fullNameOverride }}
{{- .Values.daemonset.fullNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-node" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-node" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scaleway-csi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scaleway-csi.labels" -}}
helm.sh/chart: {{ include "scaleway-csi.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scaleway-csi.deploymentSelectorLabels" -}}
app.kubernetes.io/name: {{ include "scaleway-csi.name" . }}
app.kubernetes.io/fullname: {{ include "scaleway-csi.deploymentfullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "scaleway-csi.daemonsetSelectorLabels" -}}
app.kubernetes.io/name: {{ include "scaleway-csi.name" . }}
app.kubernetes.io/fullname: {{ include "scaleway-csi.daemonsetfullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "scaleway-csi.deploymentServiceAccountName" -}}
{{- default (include "scaleway-csi.deploymentfullname" .) .Values.deployment.serviceAccount.name }}
{{- end }}
{{- define "scaleway-csi.daemonsetServiceAccountName" -}}
{{- default (include "scaleway-csi.daemonsetfullname" .) .Values.daemonset.serviceAccount.name }}
{{- end }}
