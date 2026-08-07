{{/*
Expand the name of the chart.
*/}}
{{- define "secrets-store-csi-driver-provider-scw.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "secrets-store-csi-driver-provider-scw.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "secrets-store-csi-driver-provider-scw.labels" -}}
helm.sh/chart: {{ include "secrets-store-csi-driver-provider-scw.chart" . }}
{{ include "secrets-store-csi-driver-provider-scw.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: secrets-store-csi-driver
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "secrets-store-csi-driver-provider-scw.selectorLabels" -}}
app.kubernetes.io/name: {{ include "secrets-store-csi-driver-provider-scw.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: provider
{{- end }}
