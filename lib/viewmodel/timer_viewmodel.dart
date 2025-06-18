import 'package:flutter/foundation.dart';
import 'package:fokko/models/timer_mode.dart';
import 'package:fokko/models/timer_state.dart';
import 'package:fokko/services/timer_service.dart';

class TimerViewmodel {
  final ValueNotifier<TimerState> state;
  final TimerService _timerService;

  TimerViewmodel._(this.state, this._timerService);

  factory TimerViewmodel() {
    final initial = TimerState.initial();
    final notifier = ValueNotifier<TimerState>(initial);
    final service = TimerService(
      onTick: (remainingTime) {
        notifier.value = notifier.value.copyWith(remainingTime: remainingTime);
        if (remainingTime == Duration.zero) {
          notifier.value = notifier.value.copyWith(status: TimerStatus.idle);
        }
      },
    );
    return TimerViewmodel._(notifier, service);
  }

  void start() {
    if (state.value.isRunning) return;
    _timerService.pause();
    state.value = state.value.copyWith(status: TimerStatus.running);
  }

  void pause() {
    if (!state.value.isRunning) return;
    _timerService.pause();
    state.value = state.value.copyWith(status: TimerStatus.paused);
  }

  void reset() {
    _timerService.reset(state.value.mode.duration);
    state.value = state.value.copyWith(
      remainingTime: state.value.mode.duration,
      status: TimerStatus.idle,
    );
  }

  void switchMode(TimerMode newMode) {
    _timerService.cancel();
    state.value = TimerState(
      mode: newMode,
      remainingTime: newMode.duration,
      status: TimerStatus.idle,
    );
  }

  void dispose() {
    _timerService.cancel();
    state.dispose();
  }
}
