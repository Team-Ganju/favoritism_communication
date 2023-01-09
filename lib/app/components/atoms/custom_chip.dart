import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.chipTitle,
    required this.backgroundColor,
  });

  final String chipTitle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    var textMarginLeft = 8.0;
    var textMarginRight = 24.0;
    return InkWell(
      onTap: () {
        // todo チップ選択時の処理
        print("ChipTitle: $chipTitle");
      },
      child: CustomPaint(
        painter: CustomChipPainter(backgroundColor: backgroundColor),
        child: SizedBox(
          height: 25,
          child: Padding(
            padding: EdgeInsets.only(
                top: 2,
                right: textMarginRight,
                bottom: 2,
                left: textMarginLeft),
            child: Text(
              chipTitle,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChipPainter extends CustomPainter {
  const CustomChipPainter({
    required this.backgroundColor,
  });
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    var grayColor = Colors.transparent;
    paint.color = Colors.transparent;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    var side = size.height / 2;
    paint.color = backgroundColor;
    var borderPath = Path();
    borderPath.moveTo(0, 0);
    borderPath.lineTo(size.width - side, 0);
    borderPath.lineTo(size.width, size.height / 2);
    borderPath.lineTo(size.width - side, size.height);
    borderPath.lineTo(0, size.height);
    borderPath.lineTo(0, 0);
    borderPath.close();
    canvas.drawPath(borderPath, paint);

    paint = Paint()
      ..color = Colors.black54
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - side, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - side, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);

    Paint circlePaint = Paint();
    circlePaint.color = Colors.white;
    canvas.drawCircle(
        Offset(size.width - side, size.height / 2), 4, circlePaint);

    Paint line = Paint()
      ..color = Colors.black54
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    canvas.drawCircle(Offset(size.width - side, size.height / 2), 4, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
