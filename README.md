# 利用方法

## basercmsを使ってみる

このコンテナを利用すると簡単な手順で、ローカル環境でbasercmsを試すことが出来ます。

### コンテナの起動

```
$ docker-compose up -d
```

コンテナの起動が完了したら、 `http://localhost/` にアクセスしてください。basercmsのインストールページが表示されます。

### コンテナの停止

```
$ docker-compose stop
```


### コンテナの削除

```
$ docker-compose rm
```

### コンテナの状態の確認 

```
$ docker-compose ps
      Name                     Command               State                 Ports
----------------------------------------------------------------------------------------------
basercms            docker-php-entrypoint apac ...   Up      0.0.0.0:80->80/tcp
basercms-database   /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp, 33060/tcp
```

### データベースの設定情報

| name | value |
|-----------|:------------|
| host | basercms-database |
| user | basercms |
| password | Passw0rd |
| database | basercms |


## 開発環境としての利用

このコンテナを使用して、basercmsの開発などをしたい場合、以下の手順でコンテナを実行してください。
ホスト上の `./html` ディレクトリが、コンテナ内の `/var/www/basercms` にマウントされますので、ホスト側でbasercmsの修正が可能になります。

### コンテナの起動

```
$ docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d
```

### basercmsのインストール

```
$ docker exec -it basercms /bin/sh
# cd /var/www/basercms
# ./init.sh
```

インストールが完了したら、 `http://localhost/` にアクセスしてください。basercmsのインストールページが表示されます。

** basercmsのバージョンを変えたい場合は、init.sh の下記の設定を変更して下さい ** 

```
#!/bin/sh

version="4.0.8"  # 別のバージョンを使用する場合はここを変更する

curl -o /var/www/basercms-${version}.zip https://basercms.net/packages/download/basercms/${version}
...
```

## コンテナイメージのビルド

以下は、作者の環境でのビルド方法なので、独自にビルドする場合は各自ターゲット名は変更して下さい。

```
$ docker build -t kaz29/basercms .
```
