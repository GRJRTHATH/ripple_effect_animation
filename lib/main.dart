import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuri Grj',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yuri & Moon Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4),lowerBound: 0.2);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {

      setState(() {

      });
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ripple Effect"),
      ),
      body: Center(
        child: Stack(
            alignment: Alignment.center,
            children: listRadius
                .map((radius) => Container(
                      width: radius * _animationController.value,
                      height: radius * _animationController.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                              .withOpacity(1.0 - _animationController.value)),
                    ))
                .toList()),
      ),
    );
  }
}
