
export GRAFANA_URL=$(oc -n istio-system get route grafana -o jsonpath='{.spec.host}')

echo  "please access grafana url to show monitoring for istio components:"
echo  "$GRAFANA_URL"

