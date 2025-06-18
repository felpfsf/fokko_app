import 'package:fokko/viewmodel/timer_viewmodel.dart';

class StartTimerCommand {
  final TimerViewmodel viewmodel;

  StartTimerCommand(this.viewmodel);

  void execute() {
    viewmodel.start();
  }
}
