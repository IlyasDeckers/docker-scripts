# docker-scripts

## Installation

```sell
cd /opt/
sudo git clone https://github.com/IlyasDeckers/docker-scripts.git && cd docker-scripts
sudo ./install
```

## PerconaXtraDB
### Deploy a XtraDB cluster

Following command deploys a three node PerconaXtraDB cluster that scales! 

```shell
$ sudo perconaxtradb --new-cluster

This setup relies on etcd. Do you want to create a etcd container? [yes/no] yes
Please specify the etcd listen address: 10.0.2.15
Create network? [yes/no]: yes
Please specify a network name: client-network
giy60u956p5yhm8k7qam3gov8
Please specify the cluster name: cluster
Please specify the mysql root password: password

  Create etcd container: yes
  Create Network:        yes
  etcd listen address:   10.0.2.15
  Network name:          client-network
  Cluster name:          cluster
  MySQL root password:   password

Is this information correct? [yes/no] yes

Starting etcd
2017-03-11 10:01:18.717540 I | etcdmain: etcd Version: 3.1.3
2017-03-11 10:01:18.717650 I | etcdmain: Git SHA: 21fdcc6
2017-03-11 10:01:18.717655 I | etcdmain: Go Version: go1.7.5
2017-03-11 10:01:18.717660 I | etcdmain: Go OS/Arch: linux/amd64
2017-03-11 10:01:18.717665 I | etcdmain: setting maximum number of CPUs to 4, total number of available CPUs is 4
2017-03-11 10:01:18.717762 I | embed: listening for peers on http://10.0.2.15:2380
2017-03-11 10:01:18.717797 I | embed: listening for client requests on 10.0.2.15:2379
2017-03-11 10:01:18.724223 I | etcdserver: name = infra0
2017-03-11 10:01:18.724268 I | etcdserver: data dir = data.etcd
2017-03-11 10:01:18.724277 I | etcdserver: member dir = data.etcd/member
2017-03-11 10:01:18.724282 I | etcdserver: heartbeat = 100ms
2017-03-11 10:01:18.724286 I | etcdserver: election = 1000ms
2017-03-11 10:01:18.724291 I | etcdserver: snapshot count = 10000
2017-03-11 10:01:18.724301 I | etcdserver: advertise client URLs = http://10.0.2.15:2379
2017-03-11 10:01:18.724307 I | etcdserver: initial advertise peer URLs = http://10.0.2.15:2380
2017-03-11 10:01:18.724317 I | etcdserver: initial cluster = infra0=http://10.0.2.15:2380
2017-03-11 10:01:18.728533 I | etcdserver: starting member 397f075a584da03d in cluster a3568f4030882500
2017-03-11 10:01:18.728574 I | raft: 397f075a584da03d became follower at term 0
2017-03-11 10:01:18.728585 I | raft: newRaft 397f075a584da03d [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]
2017-03-11 10:01:18.728591 I | raft: 397f075a584da03d became follower at term 1
2017-03-11 10:01:18.749675 I | etcdserver: starting server... [version: 3.1.3, cluster version: to_be_decided]
2017-03-11 10:01:18.750524 I | etcdserver/membership: added member 397f075a584da03d [http://10.0.2.15:2380] to cluster a3568f4030882500
2017-03-11 10:01:19.030389 I | raft: 397f075a584da03d is starting a new election at term 1
2017-03-11 10:01:19.030429 I | raft: 397f075a584da03d became candidate at term 2
2017-03-11 10:01:19.030448 I | raft: 397f075a584da03d received MsgVoteResp from 397f075a584da03d at term 2
2017-03-11 10:01:19.030491 I | raft: 397f075a584da03d became leader at term 2
2017-03-11 10:01:19.030503 I | raft: raft.node: 397f075a584da03d elected leader 397f075a584da03d at term 2
2017-03-11 10:01:19.030906 I | etcdserver: setting up the initial cluster version to 3.1
2017-03-11 10:01:19.032089 N | etcdserver/membership: set the initial cluster version to 3.1
2017-03-11 10:01:19.032166 I | etcdserver/api: enabled capabilities for version 3.1
2017-03-11 10:01:19.032214 I | etcdserver: published {Name:infra0 ClientURLs:[http://10.0.2.15:2379]} to cluster a3568f4030882500
2017-03-11 10:01:19.032312 I | embed: ready to serve client requests
2017-03-11 10:01:19.032818 N | embed: serving insecure client requests on 10.0.2.15:2379, this is strongly discouraged!

Starting node #1
f2v2l3i14o2wppjfaxpn0hlk6

Waiting 30 seconds for the first node to bootstrap the cluster...

Starting node #2
u3pd5xmzovcneo2bzc2h3uyzr

Waiting 10 seconds for node  to start...

Starting node #3
4lhdprrzrm56yofkqdywpi1i1

Waiting 10 seconds for node  to start...

Percona XtraDB started successfully
```

### Scale the cluster
Working on it

## Etcdcontroll
Deploy and manage etcd containers like you would controll etcd on the host maschine.

### Usage

```shell
$ etcdcontroll --help

Usage: etcdcontroll --prune <foldername>/<key_name>

options:
	--shell                get an interactive etcd shell
    --cluster-health       check the cluster health
    --start-container      start a etcd container (Example: --start-container [ listen ip ] )
    --prune string         delete all keys from etcd (example: --prune galera/my_wsrep_cluster)
    --list-keys string     List all keys (example: --prune galera/my_wsrep_cluster)
```

```shell
$ etcdcontroll --list-keys galera
{
    "action": "get",
    "node": {
        "createdIndex": 4,
        "dir": true,
        "key": "/galera",
        "modifiedIndex": 4,
        "nodes": [
            {
                "createdIndex": 4,
                "dir": true,
                "key": "/galera/mysql-client",
                "modifiedIndex": 4,
                "nodes": [
                    {
                        "createdIndex": 4,
                        "dir": true,
                        "key": "/galera/mysql-client/10.0.1.3",
                        "modifiedIndex": 4,
                        "nodes": [
                            {
                                "createdIndex": 4,
                                "key": "/galera/mysql-client/10.0.1.3/ipaddress",
                                "modifiedIndex": 4,
                                "value": "10.0.1.3"
                            },
                            {
                                "createdIndex": 13,
                                "expiration": "2017-03-11T10:27:49.672974905Z",
                                "key": "/galera/mysql-client/10.0.1.3/wsrep_local_state_comment",
                                "modifiedIndex": 13,
                                "ttl": 5,
                                "value": "Synced"
                            },
                            {
                                "createdIndex": 14,
                                "expiration": "2017-03-11T10:27:49.703481687Z",
                                "key": "/galera/mysql-client/10.0.1.3/wsrep_last_committed",
                                "modifiedIndex": 14,
                                "ttl": 5,
                                "value": "6938"
                            }
                        ]
                    },
                    {
                        "createdIndex": 9,
                        "dir": true,
                        "key": "/galera/mysql-client/10.0.1.5",
                        "modifiedIndex": 9,
                        "nodes": [
                            {
                                "createdIndex": 15,
                                "expiration": "2017-03-11T10:27:59.013717222Z",
                                "key": "/galera/mysql-client/10.0.1.5/wsrep_local_state_comment",
                                "modifiedIndex": 15,
                                "ttl": 14,
                                "value": "Synced"
                            },
                            {
                                "createdIndex": 16,
                                "expiration": "2017-03-11T10:27:59.045954301Z",
                                "key": "/galera/mysql-client/10.0.1.5/wsrep_last_committed",
                                "modifiedIndex": 16,
                                "ttl": 14,
                                "value": "6938"
                            }
                        ]
                    },
                    {
                        "createdIndex": 11,
                        "dir": true,
                        "key": "/galera/mysql-client/10.0.1.7",
                        "modifiedIndex": 11,
                        "nodes": [
                            {
                                "createdIndex": 17,
                                "expiration": "2017-03-11T10:28:10.731952655Z",
                                "key": "/galera/mysql-client/10.0.1.7/wsrep_local_state_comment",
                                "modifiedIndex": 17,
                                "ttl": 26,
                                "value": "Synced"
                            },
                            {
                                "createdIndex": 18,
                                "expiration": "2017-03-11T10:28:10.761421017Z",
                                "key": "/galera/mysql-client/10.0.1.7/wsrep_last_committed",
                                "modifiedIndex": 18,
                                "ttl": 26,
                                "value": "6938"
                            }
                        ]
                    }
                ]
            }
        ]
    }
}
```

