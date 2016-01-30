# Sidekiq

### redisの設定ファイルをコピー
```
$ cp config/redis.yml.sample config/redis.yml
```
`redis.yml` を開発環境に合わせて書き換える


### 起動方法
```
$ bundle exec sidekiq -C config/sidekiq.yml
```
