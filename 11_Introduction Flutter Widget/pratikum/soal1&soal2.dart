import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  void detik() async {
    var detik = 1;
    while (detik <= 60) {
      detik++;
      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          seconds++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    detik();
  }

//soal 1 membuat statefull widget membuat konten berubah tiap detik
  @override
  Widget build(BuildContext context) {
    if (seconds == 60) {
      setState(() {
        seconds = 0;
        minutes++;
      });
      if (seconds == 0) {
        detik();
      }
    }

    if (minutes == 60) {
      setState(() {
        minutes = 0;
        hours++;
      });
    }

    if (hours == 23) {
      setState(() {
        hours = 0;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
//soal 2 membuat extract widget dapat digunakan kembali tetapi tidak mengubah tampilannya
                hour(hours: hours),
                colon(),
                minute(minutes: minutes),
                colon(),
                second(seconds: seconds),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class second extends StatelessWidget {
  const second({
    Key? key,
    required this.seconds,
  }) : super(key: key);

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Text(
      seconds > 9 ? '$seconds' : '0$seconds',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class minute extends StatelessWidget {
  const minute({
    Key? key,
    required this.minutes,
  }) : super(key: key);

  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Text(
      minutes > 9 ? '$minutes' : '0$minutes',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class colon extends StatelessWidget {
  const colon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ':',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class hour extends StatelessWidget {
  const hour({
    Key? key,
    required this.hours,
  }) : super(key: key);

  final int hours;

  @override
  Widget build(BuildContext context) {
    return Text(
      hours > 9 ? '$hours' : '0$hours',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
