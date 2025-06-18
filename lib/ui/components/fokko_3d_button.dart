import 'package:flutter/material.dart';

class Fokko3dButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const Fokko3dButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.width = 120,
    this.height = 56,
  });

  @override
  State<Fokko3dButton> createState() => _Fokko3dButtonState();
}

class _Fokko3dButtonState extends State<Fokko3dButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.height,
        width: widget.width,
        transform: Matrix4.translationValues(0, _isPressed ? 4 : 0, 0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0, 6),
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
