import 'package:flutter/material.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/util/utils.dart';
import 'package:provider/provider.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black12,
      ),
      child: IconButton(
        onPressed: () {
          provider.timerPlaying ? 
          Provider.of<TimerService>(context, listen: false).pause() : 
          Provider.of<TimerService>(context, listen: false).start();
        },
        icon: Icon(
          provider.timerPlaying == true ? Icons.pause : Icons.play_arrow,
          size: 55,
          color: renderColor(provider.currentState),
        ),
      ),
    );
  }
}
