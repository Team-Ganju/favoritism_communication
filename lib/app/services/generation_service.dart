import 'package:get/get.dart';

/// 年代
enum Generation{
  gen20,
  gen30,
  gen40,
  gen50,
  gen60,
  gen70,
  gen80,
  gen90,
}

/// 年代
/// 数値で変換した値
extension GenerationNumber on Generation{
  int get number{
    switch(this){
      case Generation.gen20:
        return 20;
      case Generation.gen30:
        return 30;
      case Generation.gen40:
        return 40;
      case Generation.gen50:
        return 50;
      case Generation.gen60:
        return 60;
      case Generation.gen70:
        return 70;
      case Generation.gen80:
        return 80;
      case Generation.gen90:
        return 90;
    }
  }
}

/// 年代
/// ドロップダウンで選択時に表示される値
extension GenerationText on Generation{
  String get label{
    return "$number代";
  }
}

class GenerationService extends GetxService {
}
