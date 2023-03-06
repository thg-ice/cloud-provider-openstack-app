#!/usr/bin/env bash
set -x

#CLOUD_PROVIDER_VERSION=master CHART_FOLDER=helm/cloud-provider-openstack-app/helm/cloud-provider-openstack-app/ ./script/update-cloud-provider-app.sh

export version=${CLOUD_PROVIDER_VERSION?}
export current_branch=$(git rev-parse --abbrev-ref HEAD)

git remote add -f upstream-copy git@github.com:kubernetes/cloud-provider-openstack.git 

#charts/cinder-csi-plugin
# ->
#   helm/cloud-provider-openstack-app/charts/openstack-cinder-csi
set -e
git fetch upstream-copy
git checkout ${version}
git subtree split -P charts/cinder-csi-plugin/ -b temp-split-branch
git checkout ${current_branch}
if [$1 -eq '--add']; then
    git subtree add --squash -P ${CHART_FOLDER?}charts/openstack-cinder-csi temp-split-branch
else
    git subtree merge --squash -P ${CHART_FOLDER?}charts/openstack-cinder-csi temp-split-branch
fi

git branch -D temp-split-branch


#charts/openstack-cloud-controller-manager
# ->
#  helm/cloud-provider-openstack-app/charts/openstack-cloud-controller-manager

git fetch upstream-copy
git checkout ${version}
git subtree split -P charts/openstack-cloud-controller-manager -b temp-split-branch
git checkout ${current_branch?}


if [$1 -eq '--add']; then
    git subtree add --squash -P ${CHART_FOLDER?}charts/openstack-cloud-controller-manager temp-split-branch
else
    git subtree merge --squash -P ${CHART_FOLDER?}charts/openstack-cloud-controller-manager temp-split-branch

fi

git branch -D temp-split-branch


# remove remote 
git remote remove upstream-copy
