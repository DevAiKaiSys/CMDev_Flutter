import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({super.key});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'Text Field',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _controller.text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            controller: _controller,
            // onChanged: (value) => {
            //   setState(() {
            //     _controller.text = value;
            //   })
            // },
            onSubmitted: (value) => {
              setState(() {
                _controller.text = value;
              })
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
          ),
        ],
      ),
    );
  }
}
