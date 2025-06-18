import 'package:fokko/viewmodel/timer_viewmodel.dart';

class ResetTimerCommand {
  final TimerViewmodel viewmodel;

  ResetTimerCommand(this.viewmodel);

  void execute() {
    viewmodel.reset();
  }
}
