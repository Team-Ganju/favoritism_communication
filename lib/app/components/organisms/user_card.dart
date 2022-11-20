import 'package:favoritism_communication/app/components/molecules/molecules.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.followAction,
      required this.userCardData,
      required this.onTapped});

  final UserCardData userCardData;
  final Widget followAction;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapped,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // fixme1: あとでatomic designでコンポーネント化する。
                            // fixme2: Firestorageで画像が取得できるようになったら修正
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: userCardData.userImage != null
                                  ? Image(
                                      image:
                                          NetworkImage(userCardData.userImage!),
                                    )
                                  : const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              // fixme: ユーザ名がFiresstoreから取れるようになったら修正
                              userCardData.userName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        followAction,
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '好きなカテゴリ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // fixme: あとでatomic design適用する(moleculesかOrganisms)
                        FavoriteCategories(userCardData: userCardData)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class CategoryData {
  final String categoryName;
  final Color categoryColor;

  const CategoryData(
    this.categoryName,
    this.categoryColor,
  );
}

class UserCardData {
  final String userName;
  final String? userImage;
  late bool isFollowed = false;
  final List<CategoryData> categories;

  UserCardData(
    this.userName,
    this.categories,
    this.userImage,
    this.isFollowed,
  );
}
