import 'package:fokko/viewmodel/timer_viewmodel.dart';

class PauseTimerCommand {
  final TimerViewmodel viewmodel;

  PauseTimerCommand(this.viewmodel);

  void execute() {
    viewmodel.pause();
  }
}
