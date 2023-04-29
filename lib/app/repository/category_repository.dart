

// カテゴリリポジトリクラスインターフェース
abstract class ICategoryRepository{
  List<Map<String, dynamic>> fetchUserCategory(String userId, String? genreId);
}

// テスト用ダミーデータリポジトリクラス
class CategoryRepositoryStub extends ICategoryRepository{
  @override
  List<Map<String, dynamic>> fetchUserCategory(String userId, String? genreId){
    return [
      {
        'userId': '001',
        'genreId': '001',
        'categoryId': '001',
        'title': 'ホラー',
      },
      {
        'userId': '001',
        'genreId': '001',
        'categoryId': '002',
        'title': 'アクション',
      },
      {
        'userId': '001',
        'genreId': '001',
        'categoryId': '003',
        'title': 'コメディ',
      },
    ];//ダミーデータを返す。
  }
}
