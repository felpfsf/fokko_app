enum TimerMode {
  // The timer is in focus mode, where the user works on a task.
  focus,
  // The timer is in break mode, where the user takes a break.
  shortBreak,
  // The timer is in long break mode, where the user takes a longer break.
  longBreak;

  String get label {
    switch (this) {
      case TimerMode.focus:
        return 'Foco';
      case TimerMode.shortBreak:
        return 'Pausa Curta';
      case TimerMode.longBreak:
        return 'Pausa Longa';
    }
  }

  Duration get duration {
    switch (this) {
      case TimerMode.focus:
        return const Duration(seconds: 5);
      case TimerMode.shortBreak:
        return const Duration(seconds: 5);
      case TimerMode.longBreak:
        return const Duration(seconds: 5);
    }
  }

  bool get isBreak => this != TimerMode.focus;
}
