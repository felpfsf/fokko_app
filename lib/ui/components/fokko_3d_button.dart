import 'package:flutter/material.dart';

class Fokko3dButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool enabled;
  final IconData? icon;
  final TextStyle? textStyle;

  const Fokko3dButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.width = 120,
    this.height = 56,
    this.enabled = true,
    this.icon,
    this.textStyle,
  });

  @override
  State<Fokko3dButton> createState() => _Fokko3dButtonState();
}

class _Fokko3dButtonState extends State<Fokko3dButton> {
  bool _isPressed = false;

  List<BoxShadow> _getBoxShadow(BuildContext context) {
    if (_isPressed || !widget.enabled) return [];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? [
            BoxShadow(color: Colors.white24, offset: Offset(0, 4)),
            BoxShadow(color: Colors.black26, offset: Offset(0, -2)),
          ]
        : [
            BoxShadow(color: Colors.black87, offset: Offset(0, 6)),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? widget.onPressed : null,
      onTapDown: (_) {
        if (widget.enabled) setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        if (widget.enabled) setState(() => _isPressed = false);
      },
      onTapCancel: () {
        if (widget.enabled) setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.height,
        width: widget.width,
        transform: Matrix4.translationValues(0, _isPressed ? 4 : 0, 0),
        decoration: BoxDecoration(
          color: widget.enabled ? widget.color : Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _getBoxShadow(context),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: widget.icon != null ? 8 : 0,
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: Colors.white,
                size: 24,
              ),
            Text(
              widget.label,
              style: widget.textStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
