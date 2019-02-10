{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "chartName" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a list of TLS hosts
*/}}
{{- define "tlsHosts" -}}
hosts:
  {{- range $thisHost := .Values.hostNames }}
  - {{ $thisHost }}
  {{- end }}
  {{- range $thisHost := .Values.tlsHostsExtra }}
  - {{ $thisHost }}
  {{- end }}
{{- end -}}
