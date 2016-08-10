# Sorcery Sample
これは以下の条件で作られたRailsプログラムです。

- has_many throughで多対多のリレーションを使う
- sorcery ([https://github.com/NoamB/sorcery](https://github.com/NoamB/sorcery "sorcery ")) を使い認証機能を実装する
- Twitter Bootstrap を使う
- RSpe を使ったテスト
- Ruby 2.0 以上
- Rails 3 または Rails 4

以上の機能の実装に興味ある方には、見れば参考になるかもしれません(ならなかったらすいません)

尚、Railsは、4.2.7、Rubyは、2.2.5p319(Ruby 2.3.0以降を使うとsqlite、bcryptがエラーを起こす為 *2016/07/30現在)の環境で作成しました。

## Docker対応
Dockerfileを追加しました。
Dockerがインストールされている環境であれば、以下のコマンドの実行で起動し、http://localhost:3000/ でアクセスできます。（-tで指定するタグはなんでも構いません）
```bash
$ docker build -t steiley/ss .
$ docker run -p 3000:3000 steiley/ss
```