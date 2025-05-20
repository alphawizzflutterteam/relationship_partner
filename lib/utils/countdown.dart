import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountUpTimer extends StatefulWidget {
  const CountUpTimer({super.key});

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startCountUpTimer();
  }

  void _startCountUpTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_elapsedSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_elapsedSeconds % 60).toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        '$minutes min $seconds sec',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}