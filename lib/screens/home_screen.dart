import 'package:bloc_internet_connection_cubits/cubits/internet_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetCubits, InternetState>(
        builder: (context, state) {
          if (state == InternetState.connected) {
            return const Text("Connected");
          } else if (state == InternetState.disconnected) {
            return const Text("Not Connected");
          } else {
            return const Text("Loading...");
          }
        },
        listener: (context, state) {
          if (state == InternetState.connected) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Internet Connected")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red, content: Text("No Internet")));
          }
        },
      )),
    );
  }
}
