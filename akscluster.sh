
export RANDOM_ID="$(openssl rand -hex 3)"
export MY_RESOURCE_GROUP_NAME="edforcerg"
export REGION="uksouth"
export MY_AKS_CLUSTER_NAME="edforceAKSCluster$RANDOM_ID"
export MY_DNS_LABEL="edforcednslabel$RANDOM_ID"

#az aks create --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_AKS_CLUSTER_NAME --node-count 1 --generate-ssh-keys


 az k8s-extension create --name demomlexten --extension-type Microsoft.AzureML.Kubernetes --config enableTraining=True enableInference=True inferenceRouterServiceType=LoadBalancer allowInsecureConnections=True InferenceRouterHA=False --cluster-type managedClusters --cluster-name $MY_AKS_CLUSTER_NAME --resource-group $MY_RESOURCE_GROUP_NAME --scope cluster

# az ml compute attach --resource-group edforcerg --workspace-name edforcews --type Kubernetes --name k8s-compute --resource-id "/subscriptions/1655f00d-a4c4-4ef2-84e1-fe175ad5cf99/resourceGroups/demorg/providers/Microsoft.ContainerService/managedClusters/myAKSCluster848db5" --identity-type SystemAssigned --namespace mlws --no-wait


# az aks get-credentials --name myAKSCluster848db5 --resource-group demorg