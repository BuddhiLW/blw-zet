# (Orasis) Azure Useful commands

## Login

```bash
az login
```

## Renew credentials for `kubectl`

``` bash
az aks get-credentials --resource-group orasis-pricing-north-central-us --name orasis-pricing-default-aks --overwrite-existing
```

## Port-forward

x->y: `x` cluster's port to `y` local port.

``` bash
kubectl port-forward svc/redpanda-console -n redpanda 8yyy:8xxx
kubectl port-forward svc/cadence-web -n cadence 8yyy:80
```


```bash
 kubectl logs deployments/cadence-frontend -n cadence
 kubectl logs -l app=pricing-backend-api-dag-manager -n pricing-apps --tail=100
 kubectl port-forward svc/cadence-frontend -n cadence 7933:7933
 kubectl port-forward svc/cadence-frontend-tunnel -n cadence 7933:7933
```