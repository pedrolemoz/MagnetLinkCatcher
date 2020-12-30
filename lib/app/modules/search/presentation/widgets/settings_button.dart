import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'rounded_element.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedElement(
      hasSplash: true,
      onTap: () {},
      child: MediaQuery.of(context).size.width > 480
          ? Row(
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 12),
                Icon(
                  UniconsLine.setting,
                  color: Color(0xFF5F6368),
                  size: 30,
                ),
              ],
            )
          : Icon(
              UniconsLine.setting,
              color: Color(0xFF5F6368),
              size: 30,
            ),
    );
  }
}