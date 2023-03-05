import 'dart:math';

import '../components/molecules/molecules.dart';

List<UserListProfileItem> dummyUserListProfileItems = [
  UserListProfileItem(
    name: "ジョン・スノウ",
    avatorUrl:
        "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2020/07/06/0ae7a72d553b6e3408fadd225705dbdd5b694c15.jpg",
    commonList: getRandomCommonList(),
    introduction:
        "ジョン・スノウは落とし子であり、王家の血を引くものである。しかし、その出生は秘密裏に隠され、彼はエダード・スタークの妾の息子として育てられた。",
  ),
  UserListProfileItem(
    name: "ナイツ・キング",
    avatorUrl:
        "https://static.wikia.nocookie.net/gameofthrones/images/1/1f/Night_King_BTW.jpg/revision/latest?cb=20210722093007",
    commonList: getRandomCommonList(),
    introduction: "ナイツ・キング（夜の王）は死者の軍勢を率いる長であり不死身である。死者を統率し動かすのは彼の力あってのことである。",
  ),
  UserListProfileItem(
    name: "デナーリス",
    avatorUrl:
        "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2018/06/28/bea397d2528f42f11e6471563fd086abe82b25f2.jpg",
    commonList: getRandomCommonList(),
    introduction:
        "デナーリス・ターガリエンはエイリス・ターガリエン二世の娘であり、古ターガリエン王朝、ウェスタロスの前王室の最後の末裔の一人である。",
  ),
  UserListProfileItem(
    name: "ティリオン",
    avatorUrl:
        "https://cdn-ak.f.st-hatena.com/images/fotolife/b/biruconti/20190321/20190321131807.jpg",
    commonList: getRandomCommonList(),
    introduction:
        "嘲りを込めて“小鬼”や“半人前”などとあだ名されるが、極めて高い知性の人である。父の政治的策略の才を受け継いでいるが、その醜さ、舌鋒の鋭さ、売春婦好きのため、そして出産が母親の死を招いたゆえに、父タイウィンから憎まれている。",
  ),
];

List<String> getRandomCommonList() {
  int rand = Random().nextInt(4) + 1;
  switch (rand) {
    case 1:
      return ["球技"];
    case 2:
      return ["陶芸", "美術"];
    case 3:
      return ["音楽", "冒険", "商売"];
    default:
      return ["読書", "映画", "旅行", "技術"];
  }
}
