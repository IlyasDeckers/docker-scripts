# Scaleable web app on Docker
Script to fire off a full web application on Docke Swarm

- Percona XtraDB cluster
- Mysql proxy
- Memcached
- Load balancers
- Letsencrypt
- Application containers

## Installation

```shell
$ cd /opt/
$ sudo git clone https://github.com/IlyasDeckers/docker-scripts.git && cd docker-scripts
$ sudo ./install
```

## Storage

## Enviroment file
```
$ sudo mv .env.example .env
```
Adjust the variables to your needs.

## PerconaXtraDB
### Deploy a XtraDB cluster

Following command deploys a three node PerconaXtraDB cluster that scales! 

```shell
$ sudo perconaxtradb --new-cluster
```

### Scale the cluster
Working on it

## MySQL Proxy

## Memcached

## Web app (eg. Laravel)

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

