---
name: Custom issue template
about: Describe this issue template's purpose here.
title: ''
labels: ''
assignees: ''

---

## 概要

- タイトル通りなら明記しない

## 事前準備

作業ブランチを切る前に必ず`develop`ブランチを最新の状態にする

※開発中は`develop`ブランチから作業ブランチを切って作業し、`main`ブランチをリリース用とする。  
特にすることがなければ`main`ブランチは触らないようにする

```code
$ git checkout develop
$ git fetch
$ git pull
$ git checkout -b feature/add-home-page  // サブブランチに作業名を付けるとわかりやすい
```

## 今回の作業内容

- 作業内容を書く
- 1日でできる作業量にすること
- 画面作成時はatomic designを意識して作成すること
  - [Flutter x Atomic Design で堅牢なデザインパターンを実現しよう](https://zenn.dev/nagakuta/articles/25c8aaf7744830bdab3d)
  - [Atomic Designを用いてFlutterアプリの責務分担を明確化しよう / Clarify the role of the Flutter app in Atomic Design](https://speakerdeck.com/ryochiba/clarify-the-role-of-the-flutter-app-in-atomic-design?slide=27)

## 注意事項

- 作業量が多くなるときは細かくコミットして良い
- developブランチへの直プッシュはしないこと
- 基本的にはdevelopブランチから作業ブランチを作ること

## プッシュ・プルリクを出す前に

### 初回コミット時

- 下記のコマンドを実行する

```code
$ git add .                         // ※特定のファイルのみコミットしたい場合はファイル名を指定する
$ git commit -m "fix #1 ホゲホゲ"    // 初回コミット時のみコミットメッセージにfix issue番号をつける
$ git log                          // コミット履歴を確認する
```

### プッシュ時の注意

- developブランチを更新
- 下記のフォーマットに従ってプッシュする

```code
$ git checkout develop
$ git pull
$ git checkout feature/issue#1 // ←issue#1は自分で作った作業ブランチに置き換える
$ git merge develop
// コンフリクトがなければ....
$ git push -u origin issue#1
```

※コンフリクトがない状態でプルリク出すために必ずすること