# get_cli

- `get`コマンドが使えるようにする

```
flutter pub global activate get_cli
```

下のようにwarningが出たら指示の通りパスを通すためのコマンドを叩いておきます。

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

## 参考
[get_cli: ^1.8.1](https://pub.dev/packages/get_cli)