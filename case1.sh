
oc apply -f destination-rule-all.yaml
export GATEWAY_URL=$(oc -n istio-system get route istio-ingressgateway -o jsonpath='{.spec.host}')
echo $GATEWAY_URL
curl -o /dev/null -s -w "%{http_code}\n" http://$GATEWAY_URL/productpage
