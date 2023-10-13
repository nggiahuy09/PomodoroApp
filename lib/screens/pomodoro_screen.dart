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
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          'P O M O D O R O',
          style: textStyle(28.0, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: Provider.of<TimerService>(context, listen: false).reset,
              icon: const Icon(
                Icons.refresh_sharp,
                color: Colors.white,
                size: 30,
              ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 15,),
              const TimerCard(),
              const SizedBox(height: 50,),
              TimeOptions(),
              const SizedBox(height: 70,),
              const TimeController(),
              const SizedBox(height: 60,),
              const ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }

}