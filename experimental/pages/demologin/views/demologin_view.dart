import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/components/atoms/custom_elevated_button.dart';
import '../../../routes/demo_app_pages.dart';
import '../controllers/demologin_controller.dart';

class DemologinView extends GetView<DemologinController> {
  DemologinView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  static const _emailMaxLength = 256;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'メールアドレス',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(_emailMaxLength),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ),
                  CustomElevatedButton(
                    buttonText: 'メールでログイン',
                    initialActiveFlag: true,
                    onPressed: () async {
                      if(_formKey.currentState?.saveAndValidate() ?? false) {
                        if(await Future.value(true)){
                          Get.toNamed(DemoRoutes.demoHome);
                        }
                      }
                      else{
                        _formKey.currentState?.invalidateField(
                          name: 'email',
                        );
                      }

                    },
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
