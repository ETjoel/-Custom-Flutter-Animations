import 'dart:math';
import 'package:flutter/material.dart';
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Triangle Icon Example'),
//         ),
//         body: Center(
//           child: Container(width: 100, height: 100, child: TriangleIcon(Colors.red, pi)),
//         ),
//       ),
//     ),
//   );
// }

class TriangleIcon extends StatelessWidget {
  Color color;
  double angle;
  TriangleIcon(this.color, this.angle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        size: const Size(10, 12),
        painter: TrianglePainter(color),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
        )
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  Color color;
  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height); // Starting point
    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(size.width / 2, 0); // Top-center point
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}