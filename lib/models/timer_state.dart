import 'package:flutter/foundation.dart';
import 'package:fokko/models/timer_mode.dart';

enum TimerStatus {
  idle,
  running,
  paused,
}

@immutable
class TimerState {
  final TimerMode mode;
  final TimerStatus status;
  final Duration remainingTime;

  const TimerState({
    required this.mode,
    required this.status,
    required this.remainingTime,
  });

  factory TimerState.initial() {
    return TimerState(
      mode: TimerMode.focus,
      status: TimerStatus.idle,
      remainingTime: TimerMode.focus.duration,
    );
  }

  TimerState copyWith({
    TimerMode? mode,
    TimerStatus? status,
    Duration? remainingTime,
  }) {
    return TimerState(
      mode: mode ?? this.mode,
      status: status ?? this.status,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }

  bool get isRunning => status == TimerStatus.running;
  bool get isPaused => status == TimerStatus.paused;
  bool get isIdle => status == TimerStatus.idle;
}
