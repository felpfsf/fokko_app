import 'dart:async';

typedef TickCallback = void Function(Duration remainingTime);

class TimerService {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  final TickCallback onTick;

  TimerService({
    required this.onTick,
  });

  void start(Duration duration) {
    _remainingTime = duration;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime -= const Duration(seconds: 1);

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
