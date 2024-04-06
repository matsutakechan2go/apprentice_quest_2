## channels テーブル

| カラム名 | データ型       | NULL | キー     | 初期値 | AUTO INCREMENT | 制約              |
|----------|--------------|------|---------|-------|----------------|------------------|
| id       | bigint(20)   | NO   | PRIMARY |       | YES            |                  |
| name     | varchar(100) | NO   |         |       |                | UNIQUE           |

## programs テーブル

| カラム名   | データ型       | NULL | キー     | 初期値 | AUTO INCREMENT | 制約                     |
|------------|--------------|------|---------|-------|----------------|--------------------------|
| id         | bigint(20)   | NO   | PRIMARY |       | YES            |                          |
| title      | varchar(100) | NO   |         |       |                |                          |
| detail     | text         | YES  |         | NULL  |                |                          |
| channel_id | bigint(20)   | NO   | INDEX   |       |                | FOREIGN KEY (channels.id) |

## genres テーブル（ジャンル）

| カラム名 | データ型     | NULL | キー     | 初期値 | AUTO INCREMENT | 制約  |
|----------|------------|------|---------|-------|----------------|-------|
| id       | bigint(20) | NO   | PRIMARY |       | YES            |       |
| name     | varchar(50)| NO   |         |       |                | UNIQUE|

## seasons テーブル（シーズン）

| カラム名     | データ型     | NULL | キー     | 初期値 | AUTO INCREMENT | 制約                 |
|--------------|------------|------|---------|-------|----------------|----------------------|
| id           | bigint(20) | NO   | PRIMARY |       | YES            |                      |
| program_id   | bigint(20) | NO   | FOREIGN |       |                | FOREIGN KEY(programs.id)|
| season_number| int        | NO   |         |       |                |                      |

## episodes テーブル（エピソード）

| カラム名             | データ型     | NULL | キー     | 初期値 | AUTO INCREMENT | 制約                          |
|----------------------|------------|------|---------|-------|----------------|-------------------------------|
| id                   | bigint(20) | NO   | PRIMARY |       | YES            |                               |
| season_id            | bigint(20) | NO   | FOREIGN |       |                | FOREIGN KEY(seasons.id)       |
| episode_number       | int        | NO   |         |       |                |                               |
| title                | varchar(100)| NO   |         |       |                |                               |
| detail               | text       | YES  |         | NULL  |                |                               |
| duration             | int        | YES  |         | NULL  |                |                               |
| release_date         | date       | YES  |         | NULL  |                |                               |
| broadcast_start_time | datetime   | YES  |         | NULL  |                |                               |
| broadcast_end_time   | datetime   | YES  |         | NULL  |                |                               |

## program_genres テーブル（番組とジャンルの関連）

| カラム名   | データ型     | NULL | キー     | 初期値 | AUTO INCREMENT | 制約                     |
|------------|------------|------|---------|-------|----------------|--------------------------|
| program_id | bigint(20) | NO   | FOREIGN |       |                | FOREIGN KEY (programs.id) |
| genre_id   | bigint(20) | NO   | FOREIGN |       |                | FOREIGN KEY (genres.id)   |

## viewers テーブル（視聴数記録）

| カラム名         | データ型     | NULL | キー     | 初期値 | AUTO INCREMENT | 制約                          |
|------------------|------------|------|---------|-------|----------------|-------------------------------|
| id               | bigint(20) | NO   | PRIMARY |       | YES            |                               |
| content_id       | bigint(20) | NO   | FOREIGN |       |                | FOREIGN KEY (episodes.id OR programs.id) |
| content_type     | varchar(50)| NO   |         |       |                |                               |
| view_count       | int        | NO   |         |       |                |                               |
| view_date        | date       | NO   |         |       |                |                               |
| platform         | varchar(50)| YES  |         | NULL  |                |                               |

