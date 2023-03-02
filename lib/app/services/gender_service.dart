import 'package:get/get.dart';

/// 性別
/// ドロップダウンで選択時に設定される値
enum Gender{
  male,
  female,
}

/// 性別
/// ドロップダウンで選択時に表示される値
extension GenderText on Gender{
  String get label{
    switch(this){
      case Gender.male:
        return '男性';

      case Gender.female:
        return '女性';
    }
  }
}

class GenderService extends GetxService {
}
