#!/bin/sh

kubectl autoscale deployment ex-dp --cpu-percent=50 --min=1 --max=5
kubectl get hpa
kubectl get hpa ex-dp -o yaml
kubectl describe hpa ex-dp

