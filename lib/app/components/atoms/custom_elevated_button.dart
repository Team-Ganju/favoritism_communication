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
      // decoration: BoxDecoration(border: ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: initialActiveFlag
                  ? BorderSide.none //活性
                  : const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ), //非活性
              borderRadius: BorderRadius.circular(300),
            ),
          ),
          foregroundColor: initialActiveFlag
              ? MaterialStateProperty.all<Color>(Colors.white) //活性
              : MaterialStateProperty.all<Color>(Colors.blue),
          backgroundColor: MaterialStateProperty.all(
            initialActiveFlag
                ? Colors.blue //活性
                : Colors.white, //非活性
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