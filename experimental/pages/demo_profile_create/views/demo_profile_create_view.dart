import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:favoritism_communication/app/components/atoms/custom_elevated_button.dart';
import '../controllers/demo_profile_create_controller.dart';

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

class DemoProfileCreateView extends GetView<DemoProfileCreateController> {
  DemoProfileCreateView({Key? key}) : super(key: key);

  static const int targetAgeLimitMin = 18;    // 対象年齢の最小値
  static const int targetAgeLimitMax = 100;   // 対象年齢の最大値
  static const EdgeInsetsGeometry fieldPadding = EdgeInsets.all(8.0); // 入力フィールドのパディング
  final _formKey = GlobalKey<FormBuilderState>();
  static const _fieldNameUserName = 'name';
  static const _fieldNameUserDescription = 'introduction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView (
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  const Text("プロフィール情報登録",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        _buildTextField(
                          name: _fieldNameUserName,
                          label: 'ユーザー名',
                          validator:FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        _buildDropDownButton<Gender>(
                          context: context,
                          items: _constructGenderItems(),
                          label: '性別',
                          onChanged: (Gender? age) => {}, //TODO: 値の更新処理
                          value: Gender.male,
                        ),
                        _buildDropDownButton<int>(
                          context: context,
                          items: _constructAgeItems(),
                          label: '年代',
                          onChanged: (int? age) => {}, //TODO: 値の更新処理
                          value: 2000,
                        ),
                        _buildTextField(
                          name: _fieldNameUserDescription,
                          label: "自己紹介",
                        )
                      ],
                    ),
                  ),

                  CustomElevatedButton(
                    buttonText: '登録する',
                    initialActiveFlag: true,
                    onPressed: () {
                      // バリデーションチェック
                      if(_formKey.currentState?.saveAndValidate() ?? false){
                        if (kDebugMode) {
                          print('登録完了');
                        } //TODO: 登録処理
                        return ;
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// テキストフィールドの生成
  Widget _buildTextField({
    required String name,
    String? label,
    String? Function(String?)? validator,
  }){
    return Padding(
      padding: fieldPadding,
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          label: label != null ? Text(label) : null,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  /// ドロップダウンボタンの生成
  Widget _buildDropDownButton<T>({
    required BuildContext context,
    required List<DropdownMenuItem<T>> items,
    String? label,
    void Function(T? value)? onChanged,
    T? value,
  }){
    return Padding(
      padding: fieldPadding,
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          label: label != null ? Text(label) : null,
          border: const OutlineInputBorder(),
        ),
        child: DropdownButton<T>(
          menuMaxHeight: MediaQuery.of(context).size.height / 3,  // ドロップダウン表示は画面高さの1/3まで
          underline: Container(),
          isExpanded: true,
          items: items,
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }

  /// 性別のドロップダウンアイテムを構築
  List<DropdownMenuItem<Gender>> _constructGenderItems(){
    return [
      DropdownMenuItem(
        value: Gender.male,
        child: Text(Gender.male.label),
      ),
      DropdownMenuItem(
      value: Gender.female,
      child: Text(Gender.female.label),
      )
    ];
  }

  /// 年代のドロップダウンアイテムを構築
  List<DropdownMenuItem<int>> _constructAgeItems(){
    // 現在の西暦をもとに、生まれ年の最小と最大を算出
    int min = DateTime.now().year - targetAgeLimitMax;
    int max = DateTime.now().year - targetAgeLimitMin;
    return List<DropdownMenuItem<int>>.generate(
        (max-min + 1),  // 最小と最大を含んだ数分リスト生成
        (i)  {
          return DropdownMenuItem(
            value: min + i,
            child: Text((min + i).toString()),
          );
        }
    );
  }
}
