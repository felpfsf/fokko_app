import 'package:flutter/material.dart';
import 'package:fokko/commands/pause_timer_command.dart';
import 'package:fokko/commands/reset_timer_command.dart';
import 'package:fokko/commands/start_timer_command.dart';
import 'package:fokko/theme/app_colors.dart';
import 'package:fokko/ui/components/fokko_3d_button.dart';
import 'package:fokko/viewmodel/timer_viewmodel.dart';

class TimerControls extends StatelessWidget {
  final TimerViewmodel viewmodel;

  const TimerControls({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewmodel.state,
      builder: (_, state, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            if (state.isRunning)
              Fokko3dButton(
                label: 'Pausar',
                color: AppColors.secondaryColor,
                onPressed: () => PauseTimerCommand(viewmodel).execute(),
              )
            else
              Fokko3dButton(
                label: 'Iniciar',
                color: AppColors.primaryColor,
                onPressed: () => StartTimerCommand(viewmodel).execute(),
              ),
            Fokko3dButton(
              label: 'Resetar',
              color: AppColors.primaryColor,
              onPressed: () => ResetTimerCommand(viewmodel).execute(),
            )
          ],
        );
      },
    );
  }
}
