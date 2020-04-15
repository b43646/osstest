
oc -n bookinfo apply -f virtual-service-all-v1.yaml

export GATEWAY_URL=$(oc -n istio-system get route istio-ingressgateway -o jsonpath='{.spec.host}')
sum=0
for i in {1..3}
do
sleep 1
curl http://$GATEWAY_URL/productpage -s | grep "Ratings service is currently unavailable" >> /dev/null
sum=$(($sum+$?))
done

if [ $sum == 3 ]
then
   echo "[Request Routing]==>PASS"
else
   echo "[Request Routing]==>FAIL"
fi

