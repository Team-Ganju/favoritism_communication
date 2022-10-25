## デモ用アプリについて

- ちょっと画面を作成してすぐに確認したい。
- プロトタイプを作ってすぐに動かして確認したい

など、サクッとやりたいときのためにデモアプリ用のプロジェクトを用意しました。

`experimental`のディレクトリに`favoritism_communication`と同様の構成でアプリを作っています。

ボタンを配置してデモとして動かしたいアプリを追加していきましょう。

## デモ用アプリの動かし方

以下のコマンドで動かすことができます。

```
flutter run -t lib/experimental/main_demo.dart
```

※シミュレータを立ち上げておく必要があります。

※現状はflavorを設定してないのでdebugできません。

flavorとVSCodeの設定をすることによりdebugできるようになります。たぶん。。