import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = context.read<NameCubit>().state;
    BlocBuilder<NameCubit, String>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Name'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _namecontroller,
            decoration: InputDecoration(labelText: "Desired name:"),
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final name = _namecontroller.text;
                    context.read<NameCubit>().change(name);
                    Navigator.pop(context);
                  },
                  child: Text('Change')),
            ),
          ),
        ],
      ),
    );
  }
}
