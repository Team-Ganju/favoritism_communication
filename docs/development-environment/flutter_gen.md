# flutter_genを使って開発していく方法について
## flutter_genの導入方法

- 共通(flutter_genを導入後に使っていきたい人向け)

Homebrew, Dart Command-Line, pubspec.yamlに書く方法の3つがあります。

※今回はpubspecに書かずコマンド実行で導入してます。

Homebrewでインストールする場合
```
$ brew install FlutterGen/tap/fluttergen
```

Dart Command-Lineでも導入できます。
```
$ dart pub global activate flutter_gen
```

fluttergenコマンドが使えるか確認しましょう
```
$ fluttergen -h
```

## 利用方法

pubspec.yamlの`assets`にimagesとjsonのパスを追記しました。  
```
assets:
    - assets/images/
    - assets/json/
```

今後ファイルを追加する場合はこのパスの配下にファイルを追加して、以下のコマンドを実行し
メソッドを自動生成します。

```
$ fluttergen
```

メソッドを自動生成したら、以下のようにして利用できます。

```
Widget build(BuildContext context) {
  return Assets.images.profile.image();
}
```


## 参考
[flutter_gen: ^5.1.0+1](https://pub.dev/packages/flutter_gen)