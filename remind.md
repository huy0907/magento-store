### tech
docker
mysql | mariadb (10.4 | 8.)
composer
nginx
php 7.4
magento 2.4

### command create admin
`sudo bin/magento admin:user:create --admin-user=admin --admin-password=admin@123 --admin-email=18021231@vnu.edu.vn --admin-firstname=Pham --admin-lastname=Quang`

### create sample data
`sudo bin/magento sampledata:deploy`
after
`sudo bin/restart`

`bin/magento setup:upgrade`   // run update code

### referent
https://devdocs.magento.com/videos/fundamentals/create-a-new-page/
https://www.youtube.com/channel/UCZeJjcZ0_rnvL-pp7p4Aq3A

1:  https://github.com/markshust/docker-magento
2:  https://github.com/magento/magento2-sample-data
3:
    + https://devdocs.magento.com/guides/v2.4/install-gde/install/sample-data-after-composer.html

    + https://devdocs.magento.com/guides/v2.4/install-gde/install/sample-data-after-clone.html


deploy data:
https://devdocs.magento.com/guides/v2.4/install-gde/prereq/connect-auth.html

4: install docker, composer, magento2

### product

`https://magento2.test/`

admin
`https://magento2.test/admin`

### run

```bash
sudo bin/setup magento2.test
open https://magento2.test/ 
```

### start server
`
sudo bin/restart
sudo lsof -i -P -n | grep LISTEN
sudo pkill mariadbd

sudo pkill teamviewe
sudo pkill navicatmo
sudo pkill docker-pr
sudo pkill nginx
sudo bin/restart
`

### cheat

sudo chmod -R ugo+rw int3506