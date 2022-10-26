# favoritism_communication

偏愛マップでマッチングして、チャットやゲームをして誰とでも共通の好きなことで仲良くなるためのアプリ

[企画資料](https://docs.google.com/presentation/d/1LxMSLHyVTsuxiJAP1ZouPC1TwuA1Yk-DCf8RU-pRduM/edit#slide=id.g35f391192_00)

## 事前準備

- コマンドプロンプトを短くしておく  
[【zsh】絶対やるべき！ターミナルでgitのブランチ名を表示&補完【git-prompt / git-completion】](https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d)

- Githubのアカウント取得

- ローカルにgitconfigの設定をする

gitconfigの設定確認を下記コマンドでする

git config --global --edit
ユーザ名とメールアドレスを設定しておく

※下記のMy Nameとmyname@example.comは自身のGithubアカウントにする

```
git config --global user.name "My Name"
git config --global user.email myname@example.com
```

- SSHKeyを生成してGithubに登録

下記リンクを参考にSSHKeyを生成してGithubに登録しておいてください

[GitHubでssh接続する手順ー公開鍵・秘密鍵の生成からー](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)

- 必須ではないけど、git aliasを設定しておくと長いコマンド撃たなくていい

[【git】aliasの設定方法](https://qiita.com/chihiro/items/04813c707cc665de67c5)

## 開発環境

- Flutter-3.3.4-stable(バージョンアップがあれば都度対応)
- GetX
- JAVA openJDK 11
- Node.js latest
- Firebase
    - LocalではFirebase Local Emulator Suiteを使う
- VSCode
- Xcode
- Android Studio

## 開発環境構築

- これからPJTに参加する人はこちらの[README](./docs/development-environment/setup-development-environment.md)を見ながら環境構築を。

## コミュニケーションツール

- Slack
    - Flutter大学 チャンネル: #共同開発10_偏愛コミュニケーション
- [Gather](https://app.gather.town/app/CY1l1sdAwjczATVs/favoritism_communication)
- Zoom
    - 今後必要になれば

## 課題共有ツール

- [Jira Software](https://joint-dev.atlassian.net/jira/software/c/projects/FC/boards/1)

## オンラインホワイトボード(画面レイアウト図やメモなど)

- [Miro](https://miro.com/app/board/uXjVPNQ7qZ4=/)

## デモアプリ

- [デモアプリについて](./docs/demo/demo.md)

## 開発方針

[開発方針について](./docs/development-policy/development-policy.md)