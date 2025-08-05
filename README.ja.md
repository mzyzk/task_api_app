この README は [英語](README.md) と [日本語](README.ja.md) があります。

# task_api_app（日本語版）

## 概要

このアプリは、Ruby on Rails（APIモード）で構築されたシンプルなタスク管理APIです。  
`Task`モデルに対して基本的なCRUD操作を行い、JSON形式でレスポンスを返します。  
また、RSpecを使用したモデルテスト・リクエストテストを含んでいます。

---

## 使用技術

- Ruby 3.1.3
    
- Rails 6.1.7.1（APIモード）
    
- PostgreSQL
    
- RSpec
    
- FactoryBot
    

---

## セットアップ手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/yourname/task_api_app.git
cd task_api_app
```

### 2. 依存関係をインストール

```bash
bundle install
```

### 3. データベースをセットアップ

```bash
rails db:create db:migrate
```

### 4. サーバー起動

```bash
bundle exec rails s
```

---

## Taskモデル構成

|カラム名|型|必須|デフォルト|
|---|---|---|---|
|title|string|はい|-|
|description|text|いいえ|-|
|due_date|date|いいえ|-|
|completed|boolean|いいえ|false|

---

## テストの実行方法

```bash
bundle exec rspec --format documentation
```

カバー範囲：

- モデルのバリデーションテスト
    
- 全CRUD操作に対するリクエストスペック
    

---

## APIエンドポイント一覧

|メソッド|エンドポイント|説明|
|---|---|---|
|GET|/api/v1/tasks|タスク一覧取得|
|GET|/api/v1/tasks/:id|タスク詳細取得|
|POST|/api/v1/tasks|タスク新規作成|
|PATCH|/api/v1/tasks/:id|タスク更新|
|DELETE|/api/v1/tasks/:id|タスク削除|

---

## 補足

- Rails APIとTDDの学習目的で作成されたプロジェクトです。
    
- 認証は実装されていません。
    
- コードの可読性とテストの網羅性を重視しています。
    

---

## 更新履歴

- 2025-08-01：初回実装完了