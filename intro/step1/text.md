
You should install gVisor on the node `node01` and make containerd use it.

There is install script `/root/gvisor-install.sh` which should setup everything, execute it on node `node01`.


<br>
<details><summary>Solution</summary>
<br>

```
scp gvisor-install.sh node01:/root
ssh node01
    sh gvisor-install.sh
    service kubelet status
```

</details>
