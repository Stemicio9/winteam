import 'package:flutter/material.dart';
import 'package:winteam/utils/size_utils.dart';

class CannotSearchWorkersWidget extends StatelessWidget {
  const CannotSearchWorkersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 20, left: 15, right: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: Padding(
          padding: getPadding(top: 24, bottom: 24, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Non hai i permessi per cercare lavoratori',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Per cercare lavoratori devi essere un azienda',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
