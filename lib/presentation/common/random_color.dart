import 'dart:ui';

const List<Color> randomColors = [
  Color(0xFF42A5F5),
  Color(0xFFAB47BC),
  Color(0xFFFF7043),
  Color(0xFF66BB6A),
  Color(0xFFFFEB3B),
  Color(0xFFEF5350),
  Color(0xFF29B6F6),
  Color(0xFF8D6E63),
  Color(0xFFAB47BC),
];

Color getRandomColor(int index) => randomColors[index % randomColors.length];
