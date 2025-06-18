import 'dart:async';

import 'package:flutter/foundation.dart';

typedef TickCallback = void Function(Duration remainingTime);

class TimerService {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  final TickCallback onTick;

  TimerService({
    required this.onTick,
  });

  void start(Duration duration) {
    if (_timer?.isActive ?? false) {
      debugPrint('Timer is already running');
      return;
    }
    if (duration <= Duration.zero) {
      debugPrint('Invalid duration: $duration');
      return;
    }
    debugPrint('Starting timer for duration: $duration');
    _remainingTime = duration;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime -= const Duration(seconds: 1);

      debugPrint('Remaining time: $_remainingTime');

      if (_remainingTime <= Duration.zero) {
        _timer?.cancel();
        onTick(Duration.zero);
      } else {
        onTick(_remainingTime);
      }
    });
  }

  void pause() {
    _timer?.cancel();
  }

  void reset(Duration duration) {
    _timer?.cancel();
    _remainingTime = duration;
    onTick(_remainingTime);
  }

  void cancel() {
    _timer?.cancel();
  }

  bool get isRunning => _timer?.isActive ?? false;
}
