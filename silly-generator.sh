#!/bin/bash

resourceList=$(cat) # read the `kind: ResourceList` from stdin
altGreeting=$(echo "$resourceList" | yq e '.functionConfig.spec.altGreeting' - )
enableRisky=$(echo "$resourceList" | yq e '.functionConfig.spec.enableRisky' - )

echo "
kind: ResourceList
items:
- kind: ConfigMap
  apiVersion: v1
  metadata:
    name: the-map
  data:
    altGreeting: "$altGreeting"
    enableRisky: "$enableRisky"
"
