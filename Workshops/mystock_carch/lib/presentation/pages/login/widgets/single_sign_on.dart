import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_carch/presentation/viewmodels/single_sign_on_view_model.dart';

class SingleSignOn extends StatelessWidget {
  const SingleSignOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        const SizedBox(height: 12),
        _buildSingleSignOnButtons(),
      ],
    );
  }

  Row _buildDivider() {
    const gradientColor = [Colors.white10, Colors.white];

    line(List<Color> colors) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 1.0],
            ),
          ),
          width: 80.0,
          height: 1.0,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line(gradientColor),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16.0,
            ),
          ),
        ),
        line(gradientColor.reversed.toList()),
      ],
    );
  }

  Row _buildSingleSignOnButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: SingleSignOnViewModel()
            .items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FloatingActionButton(
                  heroTag: item.icon.toString(),
                  onPressed: item.onPress,
                  backgroundColor: item.backgroundColor,
                  child: FaIcon(
                    item.icon,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList(),
      );
}
