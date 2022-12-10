import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winteam/constants/colors.dart';

class DatePicker extends StatefulWidget {
  TextEditingController dateInput = TextEditingController()..text = "";
  DateTime? pickedDate;

  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }
}

class _DatePicker extends State<DatePicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.width / 3,
        child: Center(
            child: TextField(
          controller: widget.dateInput,
          //editing controller of this TextField
          decoration: const InputDecoration(
            labelText: 'Seleziona data',
            prefixIcon: Icon(Icons.date_range, color: azzurroscuro),
            hintText: 'Seleziona una data di inizio e una di fine',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                locale: const Locale('en', ''),
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              setState(() {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                widget.dateInput.text = formattedDate;
                widget.pickedDate = pickedDate;
              });
            } else {}
          },
        )));
  }
}
