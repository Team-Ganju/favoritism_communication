import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.initialActiveFlag,
    required this.onPressed,
  });

  final String buttonText;
  final bool initialActiveFlag;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 280,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: initialActiveFlag
                  ? BorderSide.none //活性
                  : const BorderSide(
                      color: colorElevatedButtonBorder,
                      width: 2.0,
                    ), //非活性
              borderRadius: BorderRadius.circular(300),
            ),
          ),
          foregroundColor: initialActiveFlag
              ? MaterialStateProperty.all<Color>(
                  colorElevatedButtonFgActive) //活性
              : MaterialStateProperty.all<Color>(colorElevatedButtonFgDeactive),
          backgroundColor: MaterialStateProperty.all(
            initialActiveFlag
                ? colorElevatedButtonBgActive //活性
                : colorElevatedButtonBgDeactive, //非活性
          ),
        ),
        //FIXME: isMemberSelectedがtrueの場合に、選択されたメンバーの情報を受け取って次画面へ遷移する処理を追加
        onPressed: () {
          onPressed?.call();
        },
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            //FIXME: 字体を指定する必要があれば修正、なければfontFamilyは削除
            // fontFamily: ,
          ),
        ),
      ),
    );
  }
}
