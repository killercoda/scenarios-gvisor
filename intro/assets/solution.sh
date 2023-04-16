#!/bin/bash

scp gvisor-install.sh node01:/root
ssh node01 sh gvisor-install.sh

sleep 3

cat > sol.yaml <<EOF
apiVersion: node.k8s.io/v1
kind: RuntimeClass
metadata:
  name: gvisor
handler: runsc
---
apiVersion: v1
kind: Pod
metadata:
  name: sec
spec:
  runtimeClassName: gvisor
  containers:
    - image: nginx:1.21.5-alpine
      name: sec
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

kubectl apply -f sol.yaml
