# Unbound on Docker

Unbound on Docker on your macOS using UDP 65353. I'm tired of running dnsmasq as root.

## Getting started

Clone this repository:

```
git clone https://github.com/lowply/docker-unbound.git
cd docker-unbound
```

Add your unbound config:

```
$ cat conf/conf.d/example.com.conf
server:
    local-zone: "example.com" redirect
    local-data: "example.com A 127.0.0.1"
```

Add your resolver file for the domain:

```
$ cat /etc/resolver/example.com
nameserver 127.0.0.1
port 65353
```

Run Unbound:

```
docker-compose up -d
```

Check if it resolved the name:

```
dscacheutil -q host -a name example.com
```

To apply changes:

```
docker-compose restart
```

Want to clear the cache?

```
sudo killall -HUP mDNSResponder
```

Happy name resolving!
