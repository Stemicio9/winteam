

import 'package:flutter/material.dart';

class CloseOnTapUtility extends StatelessWidget {

  final Widget child;

  const CloseOnTapUtility({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child
    );
  }
}
