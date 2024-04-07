#環境設定
---
##必要なソフトウェア
---
MySQL: データベース管理システム。本プロジェクトでは MySQL 8.0 を使用。
SQL クライアントソフトウェア: MySQL Workbench や DBeaver など。データベースに接続し、SQLクエリを実行するためのソフトウェア。
---
##MySQLをインストールしていない方
---
###1.MySQLのインストール
---
MySQLは[公式webサイト](https://dev.mysql.com/downloads/mysql/)からインストールできます。公式の指示に従ってインストールしてください。
---
###2.データベースとユーザーの作成
---
データベースシステムのセットアップ後、以下のコマンドを使用してプロジェクト用のデータベースとユーザーを作成します。

```sql
CREATE DATABASE '[作成したいデータベース名]';
CREATE USER '[作成したいユーザ名]'@'[ホスト名]' IDENTIFIED BY '[指定したいパスワード]';
GRANT ALL PRIVILEGES ON '[作成したいデータベース名]'* TO '[作成したいユーザ名]'@'[ホスト名]';
FLUSH PRIVILEGES;
```
---
##環境の確認方法
---
使用している MySQL のバージョンを確認するには、以下の SQL コマンドを実行します。

`SELECT version();`

---
MySQLの起動
`mysql.server start`

MySQLにログイン（実行、接続とも）
`mysql -u root -p`

---
##1. データベースの作成
---
以下のコマンドでデータベースを作成できます。

`CREATE DATABASE internet_tv;`

データベースを作成した後、作成したデータベースを選択します。

`USE internet_tv;`
---
##2.テーブルの作成
---
__channelsテーブル__
```sql
CREATE TABLE channels (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

__episodes テーブル__
```sql
CREATE TABLE episodes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    season_id BIGINT,
    episode_number INT,
    title VARCHAR(100) NOT NULL,
    detail TEXT,
    duration INT DEFAULT 30,
    release_date DATE NOT NULL,
    view_count BIGINT NOT NULL DEFAULT 0,
    broadcast_start_time DATETIME,
    broadcast_end_time DATETIME,
    FOREIGN KEY (season_id) REFERENCES seasons(id)
);
```
__genres テーブル__
```sql
CREATE TABLE genres (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE program_genres (
    program_id BIGINT,
    genre_id BIGINT,
    PRIMARY KEY (program_id, genre_id),
    FOREIGN KEY (program_id) REFERENCES programs(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
```
__programs テーブル__
```sql
CREATE TABLE programs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    detail TEXT,
    genre_id BIGINT,
    channel_id BIGINT,
    FOREIGN KEY (channel_id) REFERENCES channels(id)
);
```
__seasons テーブル__
```sql
CREATE TABLE seasons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    program_id BIGINT NOT NULL,
    season_number INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);
```

__viewers テーブル__
```sql
CREATE TABLE viewers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    content_id BIGINT NOT NULL,
    content_type VARCHAR(50) NOT NULL,
    view_count INT NOT NULL,
    view_date DATE NOT NULL,
    platform VARCHAR(50)
);
```