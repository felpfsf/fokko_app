import 'package:flutter/material.dart';
import 'package:fokko/theme/app_colors.dart';

class TimerDisplay extends StatelessWidget {
  final Duration remaingingTime;

  const TimerDisplay({super.key, required this.remaingingTime});

  @override
  Widget build(BuildContext context) {
    final minutes = remaingingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = remaingingTime.inSeconds.remainder(60).toString().padLeft(2, '0');
    final timeText = '$minutes:$seconds';

    return /* TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.95, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      key: ValueKey(timeText), // anima a cada mudança no texto
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: */
        Container(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 220),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withValues(alpha: 0.2),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Text(
        timeText,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
      ),
      // ),
    );
  }
}
