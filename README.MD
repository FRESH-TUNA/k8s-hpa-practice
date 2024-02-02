## stress test 

```bash
# run this code another shell
chmod +x cpuhog 
kubectl cp cpuhog ex-dp-6d89665fb9-nlmkh:/bin
kubectl exec ex-dp-6d89665fb9-nlmkh -- /bin/cpuhog
```


## stress result
```bash
tuna@master:~/k8s-hpa-practice$ kubectl describe hpa
Name:                                                  ex-dp
Namespace:                                             default
Labels:                                                <none>
Annotations:                                           <none>
CreationTimestamp:                                     Fri, 02 Feb 2024 02:10:59 +0000
Reference:                                             Deployment/ex-dp
Metrics:                                               ( current / target )
  resource cpu on pods  (as a percentage of request):  99% (199m) / 50%
Min replicas:                                          1
Max replicas:                                          5
Deployment pods:                                       5 current / 5 desired
Conditions:
  Type            Status  Reason            Message
  ----            ------  ------            -------
  AbleToScale     True    ReadyForNewScale  recommended size matches current size
  ScalingActive   True    ValidMetricFound  the HPA was able to successfully calculate a replica count from cpu resource utilization (percentage of request)
  ScalingLimited  True    TooManyReplicas   the desired replica count is more than the maximum replica count
Events:
  Type    Reason             Age    From                       Message
  ----    ------             ----   ----                       -------
  Normal  SuccessfulRescale  7m44s  horizontal-pod-autoscaler  New size: 1; reason: All metrics below target
  Normal  SuccessfulRescale  5m29s  horizontal-pod-autoscaler  New size: 4; reason: cpu resource utilization (percentage of request) above target
  Normal  SuccessfulRescale  5m14s  horizontal-pod-autoscaler  New size: 5; reason: cpu resource utilization (percentage of request) above target
```

