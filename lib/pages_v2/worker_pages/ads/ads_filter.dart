import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/page_constants.dart';
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
  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  final TextEditingController priceController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  List<bool> indexes = [false, false, false, false];
  List<String> texts = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];

  final format = DateFormat('dd/MM/yyyy');

  DateTime toDateMinTime = DateTime.now();
  DateTime fromDateMaxTime = DateTime.now().add(const Duration(days: 365));

  @override
  void initState() {
    super.initState();
    fillFields();
  }

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        bottomNavigationBar: AdsFilterBottombar(
          onTap: () {
            doSearch();
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AdsFilterHeader(
                onTap: () {
                  clearSearch();
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
                onChanged: setPrice,
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
                  setFromDate(date);
                },
                toDateOnChanged: (date) {
                  print('change $date');
                },
                toDateOnConfirm: (date) {
                  toDateController.text = format.format(date);
                  setDateValue(date, false);
                  setToDate(date);
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

  void fillFields() {
    if (filterAnnunciLavoratore.pagaMinima != null) {
      print('fill price ${filterAnnunciLavoratore.pagaMinima}');
      priceController.text = filterAnnunciLavoratore.pagaMinima.toString();
    }
    if (filterAnnunciLavoratore.dateRange?.start != null) {
      print('fill date start ${filterAnnunciLavoratore.dateRange?.start}');
      fromDateController.text =
          format.format(filterAnnunciLavoratore.dateRange!.start);
    }
    if (filterAnnunciLavoratore.dateRange?.end != null) {
      toDateController.text =
          format.format(filterAnnunciLavoratore.dateRange!.end);
    }

    if (filterAnnunciLavoratore.fasceOrarie != null &&
        filterAnnunciLavoratore.fasceOrarie!.isNotEmpty) {
      for (var i = 0; i < filterAnnunciLavoratore.fasceOrarie!.length; i++) {
        var a = filterAnnunciLavoratore.fasceOrarie![i];
        indexes[texts.indexOf(a)] = true;
      }
    }
  }

  void selectElement(int index, bool value) {
    setState(() {
      indexes[index] = value;
      setHourSlot();
    });
  }

  void setDateValue(date, isFrom) {
    setState(() {
      isFrom ? toDateMinTime = date : fromDateMaxTime = date;
    });
  }

  void clearSearch() {
    filterAnnunciLavoratore.pagaMinima = 0;
    filterAnnunciLavoratore.distanzaMassima = 10000;
    filterAnnunciLavoratore.fasceOrarie = [];
    filterAnnunciLavoratore.dateRange = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 365)));
    filterAnnunciLavoratore.state = 'all';
  }

  void doSearch() {
    _cubit.fetchAnnunciLavoratore(PageConstants.INIT_PAGE_NUMBER, PageConstants.PAGE_SIZE);
  }

  void setPrice(val) {
    print('setPrice $val');
    setState(() {
      if (val != null && val != '') {
        filterAnnunciLavoratore.pagaMinima = double.parse(val);
      } else {
        filterAnnunciLavoratore.pagaMinima = 0.0;
      }
    });
  }

  void setFromDate(val) {
    print('setFromDate $val');
    filterAnnunciLavoratore.dateRange = DateTimeRange(
        start: val,
        end: filterAnnunciLavoratore.dateRange?.end ??
            DateTime.now().add(const Duration(days: 5)));
  }

  void setToDate(val) {
    print('setToDate $val');
    filterAnnunciLavoratore.dateRange = DateTimeRange(
        start: filterAnnunciLavoratore.dateRange?.start ?? DateTime.now(),
        end: val);
  }

  void setHourSlot() {
    List<String> res = [];
    for (int i = 0; i < indexes.length; i++) {
      if (indexes[i]) {
        res.add(texts[i]);
      }
    }
    print('setHourSlot $res');
    filterAnnunciLavoratore.fasceOrarie = res;
  }
}
