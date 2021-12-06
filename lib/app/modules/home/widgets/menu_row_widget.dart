import 'package:flarax/app/modules/widgets/label_icon_widget.dart';
import 'package:flutter/material.dart';

class DashboardMenuRow extends StatelessWidget {
  final firstLabel;
  final firstIcon;
  final firstIconCircleColor;
  final firstOnPressed;
  final secondLabel;
  final secondIcon;
  final secondIconCircleColor;
  final secondOnPressed;
  final thirdLabel;
  final thirdIcon;
  final thirdIconCircleColor;
  final thirdOnPressed;
  final fourthLabel;
  final fourthIcon;
  final fourthIconCircleColor;
  final fourthOnPressed;

  const DashboardMenuRow(
      {Key? key,
      this.firstLabel,
      this.firstIcon,
      this.firstIconCircleColor,
      this.firstOnPressed,
      this.secondLabel,
      this.secondIcon,
      this.secondIconCircleColor,
      this.secondOnPressed,
      this.thirdLabel,
      this.thirdIcon,
      this.thirdIconCircleColor,
      this.thirdOnPressed,
      this.fourthLabel,
      this.fourthIcon,
      this.fourthIconCircleColor,
      this.fourthOnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            onTap: firstOnPressed,
            child: LabelBelowIcon(
              icon: firstIcon,
              label: firstLabel,
              circleColor: firstIconCircleColor,
            ),
          ),
          InkWell(
            onTap: secondOnPressed,
            child: LabelBelowIcon(
              icon: secondIcon,
              label: secondLabel,
              circleColor: secondIconCircleColor,
            ),
          ),
          InkWell(
            onTap: thirdOnPressed,
            child: LabelBelowIcon(
              icon: thirdIcon,
              label: thirdLabel,
              circleColor: thirdIconCircleColor,
            ),
          ),
          InkWell(
            onTap: fourthOnPressed,
            child: LabelBelowIcon(
              icon: fourthIcon,
              label: fourthLabel,
              circleColor: fourthIconCircleColor,
            ),
          ),
        ],
      ),
    );
  }
}