{{/*
Expand the name of the chart.
*/}}
{{- define "scaleway-cilium-hubble.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scaleway-cilium-hubble.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scaleway-cilium-hubble.labels" -}}
helm.sh/chart: {{ include "scaleway-cilium-hubble.chart" . }}
{{ include "scaleway-cilium-hubble.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scaleway-cilium-hubble.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scaleway-cilium-hubble.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
