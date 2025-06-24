import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fokko/theme/app_colors.dart';

class SessionEndNotifier {
  static void show(BuildContext context) {
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;

    void showSnackBarAfterOverlay() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sessão encerrada!',
            textAlign: TextAlign.center,
          ),
          duration: Durations.extralong4,
        ),
      );
    }

    entry = OverlayEntry(
      builder: (_) => Positioned.fill(
        child: _FlashOverlay(
          onComplete: () {
            entry.remove();
            showSnackBarAfterOverlay();
            HapticFeedback.mediumImpact();
          },
        ),
      ),
    );

    overlay.insert(entry);
  }
}

class _FlashOverlay extends StatefulWidget {
  final VoidCallback onComplete;

  const _FlashOverlay({required this.onComplete});

  @override
  State<_FlashOverlay> createState() => __FlashOverlayState();
}

class __FlashOverlayState extends State<_FlashOverlay> with SingleTickerProviderStateMixin {
  double _opacityValue = 0.0;
  int _flashes = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        _opacityValue = _opacityValue == 0.0 ? 0.8 : 0.0;
        _flashes++;
      });

      if (_flashes >= 10) {
        _timer.cancel();
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: _opacityValue,
        duration: const Duration(milliseconds: 150),
        child: Container(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
