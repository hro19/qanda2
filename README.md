
# Ruby on Rails で作るQ&Aサイトを作成する。
Q＆Aサイトの作成
## 設定
#### Ruby・Railsの基本的なコマンド
```:コマンドプロンプト
ruby -v
rails -v
//全てのルートパスの確認
rails routes
//DBの状態をチェック
rails dbconsole
.schema [テーブル名（複数形）]
//コンソールぬけ出し方
.q
```

## 環境構築
```:コマンドプロンプト
rails new qanda2 _7.0.4_
bundle install
```
```:コマンドプロンプト
//目的とするファイルに移動
cd qanda2
//サーバー立ち上げ
rails s
```

## 『Question(質問)のコントローラー・モデル作成』
```:コマンドプロンプト
//コントローラー作成時は複数形で記述
rails g controller questions

//モデル作成時は単数形でイニシャルは大文字で記述
rails g model Question name:string title:string content:text

//モデルの情報をDBに反映します。
rails db:migrate
```

## 『Answer(回答)のコントローラー・モデル作成』
Question:Asnswer ＝ 一:多の関係ですので、Answerにquestion_idカラムを持たせることで、親である1つの質問に対して複数の回答を持つことが可能となります。

```:コマンドプロンプト
//モデル作成時は単数形でイニシャルは大文字で記述
rails g model Answer name:string content:text question:references

//モデルの情報をDBに反映します。
rails db:migrate

//コントローラー作成時は複数形で記述
rails g controller answers
```

Rubocopの使い方

```
//全てのファイルを解析
rubocop

//自動修正できるところは修正
rubocop -a

//コントローラー
rubocop app/controllers

//モデル
rubocop app/models


```