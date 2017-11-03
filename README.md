# 利用方法

## コンテナの起動

```
$ docker-compose up -d
```

## コンテナの停止

```
$ docker-compose stop
```


## コンテナの削除

```
$ docker-compose rm
```

## コンテナの状態の確認 

```
$ docker-compose ps
      Name                     Command               State                 Ports
----------------------------------------------------------------------------------------------
basercms            docker-php-entrypoint apac ...   Up      0.0.0.0:80->80/tcp
basercms-database   /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp, 33060/tcp
```

## データベースの設定情報

| name | value |
|-----------|:------------|
| host | basercms-database |
| user | basercms |
| password | Passw0rd |
| database | basercms |

