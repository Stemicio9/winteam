import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_filter_bottombar.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_filter_chips.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_filter_date.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_filter_header.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_filter_price.dart';

class AdsFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdsFilterState();
  }
}

class AdsFilterState extends State<AdsFilter> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  List<bool> indexes = [false, false, false, false];
  List<String> texts = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];

  final format = DateFormat('dd/MM/yyyy');

  DateTime toDateMinTime = DateTime.now();
  DateTime fromDateMaxTime = DateTime.now().add(const Duration(days: 365));

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        bottomNavigationBar: AdsFilterBottombar(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AdsFilterHeader(
                onTap: () {
                  fromDateController.text = '';
                  toDateController.text = '';
                  priceController.text = '';
                  setState(() {
                    indexes = [false, false, false, false];
                  });
                },
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
              AdsFilterPrice(
                priceController: priceController,
              ),
              AdsFilterDate(
                fromDateController: fromDateController,
                toDateController: toDateController,
                fromDateOnChanged: (date) {
                  print('change $date');
                },
                fromDateOnConfirm: (date) {
                  fromDateController.text = format.format(date);
                  setDateValue(date, true);
                },
                toDateOnChanged: (date) {
                  print('change $date');
                },
                toDateOnConfirm: (date) {
                  toDateController.text = format.format(date);
                  setDateValue(date, false);
                },
                fromDateMaxTime: fromDateMaxTime,
                fromDateMinTime: DateTime.now(),
                toDateMaxTime: DateTime.now().add(const Duration(days: 365)),
                toDateMinTime: toDateMinTime,
              ),
              AdsFilterChips(
                indexes: indexes,
                texts: texts,
                valueSelected: selectElement,
              ),
            ],
          ),
        ));
  }

  void selectElement(int index, bool value) {
    setState(() {
      indexes[index] = value;
    });
  }

  void setDateValue(date, isFrom) {
    setState(() {
      isFrom ? toDateMinTime = date : fromDateMaxTime = date;
    });
  }
}
