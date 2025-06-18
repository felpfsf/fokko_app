import 'package:flutter/material.dart';
import 'package:fokko/commands/pause_timer_command.dart';
import 'package:fokko/commands/reset_timer_command.dart';
import 'package:fokko/commands/start_timer_command.dart';
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
              ElevatedButton(
                onPressed: () => PauseTimerCommand(viewmodel).execute(),
                child: const Text('Pausar'),
              )
            else
              ElevatedButton(
                onPressed: () => StartTimerCommand(viewmodel).execute(),
                child: const Text('Iniciar'),
              ),
            ElevatedButton(
              onPressed: () => ResetTimerCommand(viewmodel).execute(),
              child: const Text('Resetar'),
            ),
          ],
        );
      },
    );
  }
}
