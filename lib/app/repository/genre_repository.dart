// ジャンルリポジトリクラスインターフェース
abstract class IGenreRepository{
  List<Map<String, dynamic>> fetchUserGenre(String userId);
}

// テスト用ダミーデータリポジトリクラス
class GenreRepositoryStub extends IGenreRepository{
  @override
  List<Map<String, dynamic>> fetchUserGenre(String userId){
    return [
      {
        'userId': '001',
        'genreId': '001',
        'title': '映画',
      },
      {
        'userId': '001',
        'genreId': '002',
        'title': '旅行',
      },
      {
        'userId': '001',
        'genreId': '003',
        'title': '料理',
      },
      {
        'userId': '001',
        'genreId': '004',
        'title': 'スポーツ',
      },
      {
        'userId': '001',
        'genreId': '005',
        'title': '漫画',
      },
    ];//ダミーデータを返す。
  }
}
