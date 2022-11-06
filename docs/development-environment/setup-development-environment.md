# 開発環境構築

## リモートリポジトリからクローンしてくる

```
git clone git@github.com:Team-Ganju/favoritism_communication.git
```

※VS Code, Xcode, Android Studioのインストールとセットアップができていれば  
以下のasdfのインストールのみでOKです。

## asdfでFlutter, java, nodejsをインストールする

このPJTではasdfをバージョン管理ツールとして使用します。

- Homebrewでasdfをインストールします。

※事前にHomebrewをインストールしておいてください

```
brew install asdf
```

- パスを通します

```
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
source ~/.zshrc
```

- プラグインを追加しておきます

```
asdf plugin add flutter
asdf plugin add nodejs
asdf plugin add java
```

- PJTルート(※)で`asdf install`を実行してください

※`.tool-version`のファイルがあるディレクトリでインストール実行してください

```
cd $PJT_ROOT
PJT_ROOT/ $ asdf install

// asdfが有効になっているか確認する
asdf current
```

※flutterをasdfでインストールするときにjqコマンドがないとエラー出るときはjqコマンド入れましょう

[【Flutter】asdfでのFlutter 3.0.0のインストールに手こずった話](https://blog.dalt.me/3318)

VS CodeにasdfのPATHも設定する必要があります。

[こちらの記事](https://zenn.dev/riscait/articles/asdf-flutter#vscode%E3%81%A7%E5%BF%85%E8%A6%81%E3%81%AA%E8%A8%AD%E5%AE%9A)を参考に設定してください。

参考: [(元記事)asdfでFlutter SDKのバージョンをアプリ毎に管理する](https://zenn.dev/riscait/articles/asdf-flutter)


## VSCodeのセットアップ

このPJTではVSCodeを主に使うのでインストールしておいてください。

以下のプラグインを入れておくことをオススメします。
- Dart
- Flutter
- Flutter Widget Snippets
- GetX Snippets


## Xcodeのセットアップ

- XcodeをコマンドまたはApp Storeでインストールしておいてください

コマンドでインストールするときは、Homebrewのmasコマンドを使います。

※masコマンドをインストールしておく必要があります。

```
// Xcodeの mas id: 497799835
// mas search Xcodeで検索できる
mas install 497799835
```

- Xcode の使用許諾契約に同意するために、Xcode を起動するか以下のコマンドを実行して最後にagreeと入力します。

```
sudo xcodebuild -license
```

- iOSシミュレータが起動することを確認する

```
open -a Simulator
```

- Xcode プロジェクトのライブラリ依存関係を管理するための Cocoapods をインストールします。

```
sudo gem install cocoapods
```

- flutter doctorで確認する

- `flutter doctor`で Xcode の項目が[✓]になっていることを確認します。


## Android Studioのセットアップ

- Android Studioインストール

Android 用に Android Studio の設定を行います。 Android Studio がインストールされていない場合は、以下のリンクからダウンロードしてください。

[android studio](https://developer.android.com/studio)

インストールが完了したら、作成したプロジェクトを開いておいてください。

- プラグインの追加

メニューバーの「Android Studio > Preferences...」を選択します。 画面の「Plugins」を選択し、「Dart」と「Flutter」プラグインを検索して追加（Apply）します。


- SDK の追加

メニューバーの「Tools > SDK Manager」を選択します。 SDK Tools タブを選択し、以下を追加（Apply）します。既に追加されているものは無視してください。

```
・Android SDK Command-line Tools (latest)
・Android Emulator
・Android SDK Platform-Tools
・Android SDK Tools
```

- デバイスの追加

メニューバーの「Tools > AVD Manager」を選択します。「Create Virtual Device...」を選択し、デバイスを作成します。 基本適当で良いのですが、system image には API Level が Project SDK で設定したものと一致するようにしてください。

このPJTでは、現状対応しているデバイスの最新OSバージョンで設定することにします。

`API レベル33 / Android 13`

- プロジェクトの起動確認

画面上の「no device selected」から追加したデバイスを選択し、デバイスが起動することを確認します。 その後「▶️」ボタンを選択して、Flutter プロジェクトがデバイスに反映されていることを確認します。

- Android ライセンスへの同意

以下のコマンドを実行し、ライセンスへの同意を行います。

```
flutter doctor --android-licenses
```

- flutter doctorで確認する

flutter doctorで Android の項目が[✓]になっていることを確認します。


## getコマンドが叩けるようにする

`get_cli`というパッケージを使って`get`コマンドが使えるようにします。

次の[README](../getx/get_cli.md)を参考にしてください。


## 参考
- [【Flutter】環境構築（macOS）](https://b1san-blog.com/post/flutter/flutter-setup/)