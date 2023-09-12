import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/viewmodels/single_sign_on_view_model.dart';

class SingleSignOn extends StatelessWidget {
  const SingleSignOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        SizedBox(height: 12),
        _buildSingleSignOnButton(),
      ],
    );
  }

  Row _buildDivider() {
    final gradientColor = [Colors.white10, Colors.white];
    final line = (List<Color> colors) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
            ),
          ),
          width: 80.0,
          height: 1.0,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //   Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.white10, Colors.white],
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       stops: [0.0, 1.0],
        //     ),
        //   ),
        //   width: 80.0,
        //   height: 1.0,
        // ),
        line(gradientColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16.0,
            ),
          ),
        ),
        // Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [Colors.white, Colors.white10],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         stops: [0.0, 1.0],
        //       ),
        //     ),
        //     width: 80.0,
        //     height: 1.0,
        //   ),
        line(gradientColor.reversed.toList()),
      ],
    );
  }

  Padding _buildSingleSignOnButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              // [
              //   FloatingActionButton(
              //     heroTag: "aaaa",
              //     backgroundColor: Colors.black,
              //     onPressed: () {},
              //     child: FaIcon(
              //       FontAwesomeIcons.apple,
              //       color: Colors.white,
              //     ),
              //   ),
              //   FloatingActionButton(
              //     heroTag: "aaaa",
              //     backgroundColor: Colors.red,
              //     onPressed: () {},
              //     child: FaIcon(
              //       FontAwesomeIcons.google,
              //       color: Colors.white,
              //     ),
              //   ),
              //   FloatingActionButton(
              //     heroTag: "aaaa",
              //     backgroundColor: Colors.blue,
              //     onPressed: () {},
              //     child: FaIcon(
              //       FontAwesomeIcons.facebookF,
              //       color: Colors.white,
              //     ),
              //   ),
              //   FloatingActionButton(
              //     heroTag: "aaaa",
              //     backgroundColor: Colors.green,
              //     onPressed: () {},
              //     child: FaIcon(
              //       FontAwesomeIcons.line,
              //       color: Colors.white,
              //     ),
              //   ),
              // ],
              SingleSignOnViewModel()
                  .items
                  .map((item) => FloatingActionButton(
                        heroTag: item.icon.toString(),
                        onPressed: item.onPress,
                        backgroundColor: item.backgroundColor,
                        child: FaIcon(
                          item.icon,
                          color: Colors.white,
                        ),
                      ))
                  .toList(),
        ),
      );
}
