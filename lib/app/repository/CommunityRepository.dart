// コミュニティリポジトリクラスインターフェース
abstract class ICommunityRepository{
  List<Map<String, dynamic>> fetchUserCommunity(String userId);
}

// テスト用ダミーデータリポジトリクラス
class CommunityRepositoryStub extends ICommunityRepository{
  @override
  List<Map<String, dynamic>> fetchUserCommunity(String userId){
    return [
      {
        'userId': '001',
        'communityId': '001',
        'title': 'Flutter大学',
      },
      
      {
        'userId': '001',
        'communityId': '002',
        'title': 'コミュニティ2',
      },
      {
        'userId': '001',
        'communityId': '003',
        'title': 'コミュニティ3',
      },
      {
        'userId': '001',
        'communityId': '004',
        'title': 'コミュニティ4',
      },
    ];//ダミーデータを返す。
  }
}
