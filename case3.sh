
export KIALI_URL=$(oc -n istio-system get route kiali -o jsonpath='{.spec.host}')

echo  "please access kiali url to check app graph and show distributed tracing system:"
echo  "$KIALI_URL"

echo "ctrl +c exit"

export GATEWAY_URL=$(oc -n istio-system get route istio-ingressgateway -o jsonpath='{.spec.host}')
while true
do
curl -o /dev/null -s  http://$GATEWAY_URL/productpage
done
