# get_cli

- `get`コマンドが使えるようにする

```
flutter pub global activate get_cli
```

下のようにwarningが出たら指示の通りパスを通すために`.zsrc`または`.bashrc`に追記します。

```
Warning: Pub installs executables into /opt/homebrew/Caskroom/flutter/3.3.4/flutter/.pub-cache/bin, which is not on your path.
You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):

  export PATH="$PATH":"/opt/homebrew/Caskroom/flutter/3.3.4/flutter/.pub-cache/bin"
```

`get`コマンドが使えるようになったか確認しましょう

```
$ get -v
░██████╗░███████╗████████╗   ░█████╗░██╗░░░░░░██╗
██╔════╝░██╔════╝╚══██╔══╝   ██╔══██╗██║░░░░░░██║
██║░░██╗░█████╗░░░░░██║░░░   ██║░░╚═╝██║░░░░░░██║
██║░░╚██╗██╔══╝░░░░░██║░░░   ██║░░██╗██║░░░░░░██║
╚██████╔╝███████╗░░░██║░░░   ╚█████╔╝███████╗ ██║
░╚═════╝░╚══════╝░░░╚═╝░░░   ░╚════╝░╚══════╝ ╚═╝

Version: 1.8.1

Time: 428 Milliseconds
```

## get_cliを使って画面を追加する方法

画面を追加するときは、atomic designのディレクトリ構成に基づいて、  
pagesディレクトリに追加します。以下のコマンドを実行すると画面(View)と   
それに関わるコントローラや画面遷移情報が自動で追加されます。  

※ここでは例としてsearchというページを追加します。

```
get create page:search on pages
```

```
// 上記コマンドのフォーマット
get create page:追加したいページ名 on ディレクトリ名（pagesで良い）
```

## 参考
[get_cli: ^1.8.1](https://pub.dev/packages/get_cli)