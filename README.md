# docker-HAProxy
docker-HAProxy


### Configuration ###

```
   global
       # master-worker required for `program` section
       # enable here or start with -Ws
       master-worker

       # turn on stats unix socket
       stats socket /var/lib/haproxy/stats user haproxy group haproxy mode 660 level admin
```

```
   userlist dataplaneapi
       user myusername insecure-password mypassword
```

```
   program api
       command dataplaneapi --host 0.0.0.0 --port 5555 --haproxy-bin /usr/sbin/haproxy --config-file /etc/haproxy/haproxy.cfg --reload-cmd "kill -SIGUSR2 1" --reload-delay 5 --userlist dataplaneapi
       no option start-on-reload
```


## Contact

**Project website**: https://github.com/hos7ein/docker-HAProxy

**Personal website**: https://fedorafans.com

**Author**: Hossein Aghaie <hossein.a97@gmail.com>

**Twitter**: Hossein Aghaie [@hos7ein](https://twitter.com/hos7ein)


## License

docker-HAProxy source code is available under the GPL-3.0 [License](/LICENSE).
