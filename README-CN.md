# wordpress-site-docker
A Docker Compose for WordPress Site.

## 配置说明

WordPress 站点目录：/var/www/html

## 安装 Ubuntu Systemd Service

```
% sudo cp scripts/docker-wp.service.default /lib/systemd/system/docker-wp.service
% sudo systemctl enable server-docker
% sudo systemctl start server-docker
```


## 配置修改

```
.env
TZ Timezone

```
