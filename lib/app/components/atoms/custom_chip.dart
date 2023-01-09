import 'package:favoritism_communication/app/styles/styles.dart';
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
    return CustomPaint(
      painter: CustomChipPainter(backgroundColor: backgroundColor),
      child: SizedBox(
        // decoration: BoxDecoration(color: Color.fromARGB(255, 243, 235, 217)),
        width: chipTitle.length * 25 + 16,
        height: 25,
        child: Padding(
          padding: EdgeInsets.only(top: 0, right: 8, bottom: 0, left: 8),
          child: Text(
            chipTitle,
            maxLines: 1,
          ),
        ),
      ),
    );
    // return Chip(
    //   label: Text(chipTitle),
    //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //   backgroundColor: backgroundColor,
    //   shape: const StadiumBorder(
    //     side: BorderSide(
    //       color: colorChipBorder,
    //     ),
    //   ),
    // );
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

    paint.color = backgroundColor;
    var borderPath = Path();
    borderPath.moveTo(0, 0);
    borderPath.lineTo(size.width * 3 / 4, 0);
    borderPath.lineTo(size.width, size.height / 2);
    borderPath.lineTo(size.width * 3 / 4, size.height);
    borderPath.lineTo(0, size.height);
    borderPath.lineTo(0, 0);
    borderPath.close();
    canvas.drawPath(borderPath, paint);

    paint = new Paint()
      ..color = Color.fromARGB(255, 84, 84, 84)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 3 / 4, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 3 / 4, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);

    Paint circlePaint = new Paint();
    circlePaint.color = Colors.white;
    canvas.drawCircle(
        Offset((size.width * 3 / 4) + 3, size.height / 2), 4, circlePaint);

    Paint line = new Paint()
      ..color = Color.fromARGB(255, 84, 84, 84)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    canvas.drawCircle(
        Offset((size.width * 3 / 4) + 3, size.height / 2), 4, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
