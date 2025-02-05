import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'video.dart';

final Color blue = Color(0xFF203267);
final Color lightBlue = Color(0xFF4E7DF7);
final Color white = Colors.white;
double dateSize = 30;

class Ticket extends StatelessWidget {
  const Ticket({super.key , required this.station, required this.destination, required this.origin});

  final String station;
  final String destination;
  final String origin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            color: blue,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            color: white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            "$origin-$destination",
                            style: TextStyle(
                              fontSize: 68,
                              fontWeight: FontWeight.w900,
                              color: lightBlue,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 18, top: 14),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          width: 140,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            station,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.yMd().format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                          color: blue,
                        ),
                      ),
                      ClockWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: VideoPlayerWidget(),
          ),
        ],
      ),
    );
  }
}

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late String _formattedTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _formattedTime = _getCurrentTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _formattedTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    return DateFormat('h:mm:ss a').format(DateTime.now());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          color: blue),
    );
  }
}
