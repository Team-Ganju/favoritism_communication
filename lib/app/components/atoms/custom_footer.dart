import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorFooterBorder,
            width: 1,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        //FIXME: 高さ指定は端末幅基準に直す
        height: 90,
        color: colorFooterBg,
      ),
    );
  }
}
