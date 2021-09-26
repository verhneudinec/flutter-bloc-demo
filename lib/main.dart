import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/color_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => ColorBloc(Colors.red), // TODO ??
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: BlocBuilder<ColorBloc, Color>(
            builder: (context, currentColor) {
              return AnimatedContainer(
                height: 100,
                width: 100,
                color: currentColor,
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
                _bloc.add(ColorEvent.event_red);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _bloc.add(ColorEvent.event_green);
              },
            ),
          ],
        ),
      ),
    );
  }
}
