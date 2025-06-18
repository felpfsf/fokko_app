import 'package:fokko/models/timer_mode.dart';
import 'package:fokko/viewmodel/timer_viewmodel.dart';

class SwitchTimerCommand {
  final TimerViewmodel viewmodel;

  SwitchTimerCommand(this.viewmodel);

  void execute(TimerMode newMode) {
    viewmodel.switchMode(newMode);
  }
}
