import 'package:favoritism_communication/app/components/organisms/organisms.dart';

// TODO: 外部からユーザデータを取得
List<Map<String, dynamic>> candidateMemberData = [
  {
    'name': 'Aさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'ABさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'ABCさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Bさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'BAさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'BACさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Cさん',
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
