import 'package:flutter/material.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/util/utils.dart';
import 'package:pomodoro/widgets/progress_widget.dart';
import 'package:pomodoro/widgets/time_controller_button.dart';
import 'package:pomodoro/widgets/time_options.dart';
import 'package:pomodoro/widgets/timer_cards.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Scaffold(
      backgroundColor: renderBackgroundColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderBackgroundColor(provider.currentState),
        title: Text(
          'POMODORO',
          style: textStyle(28.0, renderColor(provider.currentState), FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: Provider.of<TimerService>(context, listen: false).reset,
            icon: Icon(
              Icons.refresh_sharp,
              color: renderColor(provider.currentState),
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(height: 15),
              TimerCard(),
              SizedBox(height: 50),
              TimeOptions(),
              SizedBox(height: 70),
              TimeController(),
              SizedBox(height: 60),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
