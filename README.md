# To run


## modify values.yaml files

`emacs /helm/openstack-cinder-csi/values.yaml`

## run helm manually 

```
export KUBECONFIG=./<cluster>.kubeconfig 

kubectl label secret cloud-config app.kubernetes.io/managed-by=Helm -n kube-system
kubectl annotate secret cloud-config meta.helm.sh/release-name=cloud-provider -n kube-system
kubectl annotate secret cloud-config meta.helm.sh/release-namespace=kube-system -n kube-system
 
#kubectl label daemonset openstack-cloud-controller-manager  app.kubernetes.io/managed-by=Helm -n kube-system
#kubectl annotate daemonset openstack-cloud-controller-manager  meta.helm.sh/release-name=cloud-provider -n kube-system
#kubectl annotate daemonset openstack-cloud-controller-manager meta.helm.sh/release-namespace=kube-system -n kube-system

k -n kube-system delete daemonset openstack-cloud-controller-manager

 helm install cloud-provider -n kube-system ./helm/cloud-provider-openstack-app/

 ```

# Metrics

https://github.com/kubernetes/cloud-provider-openstack/blob/master/docs/metrics.md

# Support cinder csi features :

https://github.com/kubernetes/cloud-provider-openstack/blob/master/docs/cinder-csi-plugin/using-cinder-csi-plugin.md#supported-features



# git subtree

```
git remote add -f --no-tags upstream-copy git@github.com:giantswarm/cloud-provider-openstack.git  

export version=release-1.22
```

## charts/cinder-csi-plugin -> helm/cloud-provider-openstack-app/charts/openstack-cinder-csi


```
git fetch upstream-copy
git checkout $version
git subtree split -P charts/cinder-csi-plugin/ -b temp-split-branch
git checkout master
git subtree merge --squash -P helm/cloud-provider-openstack-app/charts/openstack-cinder-csi temp-split-branch
git push
git branch -D temp-split-branch
```

## charts/openstack-cloud-controller-manager -> helm/cloud-provider-openstack-app/charts/openstack-cloud-controller-manager


```
git fetch upstream-copy
git checkout $version
git subtree split -P charts/openstack-cloud-controller-manager -b temp-split-branch
git checkout master
git subtree merge --squash -P helm/cloud-provider-openstack-app/charts/openstack-cloud-controller-manager temp-split-branch
git push
git branch -D temp-split-branch
```

