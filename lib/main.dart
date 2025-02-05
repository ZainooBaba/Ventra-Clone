import 'package:flutter/material.dart';

import 'ticket.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({
    super.key,
    required this.station,
    required this.destination,
    required this.origin,
  });

  final String station;
  final String destination;
  final String origin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ticket(
        station: station,
        destination: destination,
        origin: origin,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ticket Input Form',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController stationController = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    stationController.dispose();
    originController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Ticket Information'),
        backgroundColor: const Color.fromARGB(255, 21, 79, 180),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextField(
                controller: stationController,
                labelText: 'Station',
                maxLength: 2,
                hintText: 'Enter Station Code',
              ),
              _buildTextField(
                controller: originController,
                labelText: 'Origin',
                maxLength: 1,
                hintText: 'Enter Origin Code',
              ),
              _buildTextField(
                controller: destinationController,
                labelText: 'Destination',
                maxLength: 1,
                hintText: 'Enter Destination Code',
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondRoute(
                          station: stationController.text.toUpperCase(),
                          destination: destinationController.text,
                          origin: originController.text,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white,),
                  label: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Set the text color to white or any color you prefer
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required int maxLength,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}
