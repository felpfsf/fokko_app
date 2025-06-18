import 'package:flutter/material.dart';
import 'package:fokko/models/timer_mode.dart';
import 'package:fokko/ui/components/timer_controls.dart';
import 'package:fokko/viewmodel/timer_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TimerViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();
    _viewmodel = TimerViewmodel();
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _viewmodel.state,
            builder: (_, state, __) {
              final minutes = state.remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
              final seconds = state.remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Text(
                    state.mode.label,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '$minutes:$seconds',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TimerControls(viewmodel: _viewmodel),
                  Wrap(
                    spacing: 12,
                    children: TimerMode.values.map(
                      (mode) {
                        final isSelected = state.mode == mode;

                        return ChoiceChip(
                          label: Text(mode.label),
                          selected: isSelected,
                          onSelected: (_) => _viewmodel.switchMode(mode),
                        );
                      },
                    ).toList(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
