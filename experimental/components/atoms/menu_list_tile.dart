import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget{
  const MenuListTile({
    this.title,
    this.textColor,
    this.onTap,
    this.isTop = false,
    super.key,
  });

  final String? title;
  final Color? textColor;
  final void Function()? onTap;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
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
      child: IntrinsicHeight(
        child: Stack(
          children: [
            ListTile(
              title: title!=null ? Text(title!, style: style,) : null,
              textColor: textColor ?? Colors.grey,
              onTap: onTap,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }

}

