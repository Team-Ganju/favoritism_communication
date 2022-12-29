import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/demo_home_controller.dart';

class DemoHomeView extends GetView<DemoHomeController> {
  const DemoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'ユーザID:${controller.authService.uid.val}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ユーザー情報',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, title: 'プロフィール情報登録', isTop: true),
                _buildMenuItem(context, title: 'プロフィール情報閲覧'),
                _buildMenuItem(context, title: 'プロフィール情報編集'),
                _buildMenuItem(context, title: 'プロフィール削除', textColor: Colors.red),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    {
      String? title,
      Color? textColor,
      bool isTop = false,
    }
  )
  {
    const border = BorderSide(
      color: Colors.grey,
      width:0.8,
    );

    TextStyle? style = Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor ?? Colors.grey);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: isTop ? border : BorderSide.none,
          bottom: border,
        )
      ),
      child: ListTile(
        title: title!=null ? Text(title, style: style,) : null,
        textColor: textColor ?? Colors.grey,
      ),
    );
  }
}
