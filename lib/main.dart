import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: Colors.red,
            builder: (context, snapshot) {
              return AnimatedContainer(
                height: 100,
                width: 100,
                color: snapshot.data,
                duration: Duration(milliseconds: 500),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_green);
              },
            ),
          ],
        ),
      ),
    );
  }
}
