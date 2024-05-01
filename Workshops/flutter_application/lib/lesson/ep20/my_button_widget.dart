import 'package:flutter/material.dart';

class MyButtonsWidget extends StatelessWidget {
  const MyButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* TextButton
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          //* Same as above
          // style: ButtonStyle(
          //   foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(18),
          //     ),
          //   ),
          // ),
          onPressed: () {
            print("TextButton pressed");
          },
          child: const Text('TextButton'),
        ),
        //* ElevatedButton
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Elevated Button',
              style: TextStyle(color: Colors.white),
            )),
        //* OutlinedButton
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () {},
          child: const Text('Outlined Button'),
        ),
      ],
    );
  }
}
