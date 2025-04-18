
Now that gVisor should be configured, create a new *RuntimeClass* for it.

Then create a new *Pod* named `sec` using image `nginx:1.21.5-alpine`.

Verify your setup by running `dmesg` in the *Pod*.



<br>
<details><summary>Tip</summary>
<br>

The handler for the gVisor *RuntimeClass* is `runsc`.

</details>




<br>
<details><summary>Solution</summary>
<br>

First we create the *RuntimeClass*

```yaml
apiVersion: node.k8s.io/v1
kind: RuntimeClass
metadata:
  name: gvisor
handler: runsc
```

<br>

And the *Pod* that uses it

<br>

```yaml
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
```

</details>




<br>
<details><summary>Verify</summary>
<br>

```
k exec sec -- dmesg | grep -i gvisor
```

</details>
