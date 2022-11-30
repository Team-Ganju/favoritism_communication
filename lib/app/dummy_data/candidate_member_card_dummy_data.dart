import 'package:favoritism_communication/app/components/organisms/organisms.dart';

// TODO: 外部からユーザデータを取得
List<Map<String, dynamic>> candidateMemberData = [
  {
    'name': 'Kaz',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Motaken',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Raiki',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Nisshy',
    'image': null,
    'isSelected': false,
  },
];
List<CandidateMemberCardData> candidateMemberCardList = candidateMemberData.map(
  (item) {
    return CandidateMemberCardData(
      item['name'],
      item['image'],
      item['isSelected'],
    );
  },
).toList();
