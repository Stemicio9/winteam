import 'package:flutter/material.dart';

class CannotCreateAdsWidget extends StatelessWidget {
  const CannotCreateAdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Non hai i permessi per creare annunci'));
  }
}
