import 'package:flutter/material.dart';
import 'package:fokko/models/timer_mode.dart';
import 'package:fokko/models/timer_state.dart';
import 'package:fokko/ui/components/session_end_notifier.dart';
import 'package:fokko/ui/components/theme_switch_widget.dart';
import 'package:fokko/ui/components/timer_controls.dart';
import 'package:fokko/ui/components/timer_display.dart';
import 'package:fokko/viewmodel/timer_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TimerViewmodel _viewmodel;
  TimerStatus? _lastStatus;

  @override
  void initState() {
    super.initState();
    _viewmodel = TimerViewmodel();
    _lastStatus = _viewmodel.state.value.status;
    _viewmodel.state.addListener(_handleStatusChange);
  }

  void _handleStatusChange() {
    final current = _viewmodel.state.value.status;
    if (_lastStatus == TimerStatus.running && current == TimerStatus.idle) {
      SessionEndNotifier.show(context);
    }

    _lastStatus = current;
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
      appBar: AppBar(
        actions: [ThemeSwitchWidget()],
      ),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _viewmodel.state,
            builder: (_, state, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Text(
                    state.mode.label,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TimerDisplay(remaingingTime: state.remainingTime),
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
