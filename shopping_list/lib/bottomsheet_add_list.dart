/* import 'package:flutter/material.dart';
import 'package:shopping_list/list_model.dart';

//import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:shopping_list/my_colors.dart';
//import 'package:persian_modal_date_picker/button.dart';
import 'package:persian_modal_date_picker/persian_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';

class BottomSheetAddList extends StatefulWidget {
  BottomSheetAddList({super.key, required this.onAdd});
  

  @override
  State<BottomSheetAddList> createState() =>
      _BottomSheetAddshoppingListtate();
 final Function(ListModel shopping) onAdd;     
}


class _BottomSheetAddshoppingListtate extends State<BottomSheetAddList> {
  
  TextEditingController dateController = TextEditingController();
  TextEditingController nameListController = TextEditingController();

  Date? selectedDate;

  String format(Date? d) {
    if (d == null) return '';
    final formatter = d.formatter;
    return '${formatter.wN} ${formatter.d} ${formatter.mN} ${formatter.yyyy}';
  }

  void showDatePicker() async {
    await showPersianDatePicker(
      context,
      (context, Date date) async {
        setState(() {
          selectedDate = date;
          dateController.text = selectedDate.toString().replaceRange(0, 6, '');
        });
        print(dateController.runtimeType);
        Navigator.of(context).pop();
      },
      yearDirection: YearDirection.both,
      border: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      validate: (ctx, date) {
        return date.year >= 1402;
      },
      submitButtonStyle: defaultButtonsStyle.copyWith(
        text: 'انتخاب',
        backgroundColor: Colors.blueAccent,
        radius: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*   Future<void> selectDate() async {
      Jalali? picked = await showPersianDatePicker(
        context: context,
        initialDate: Jalali.now(),
        firstDate: Jalali(1385),
        lastDate: Jalali(1485),
        
      );
      if (picked != null) {
        setState(() {
          dateController.text = picked.toJalaliDateTime();
        });
      }
      print(picked);
    } */

    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: SolidColors.bgBtmsheet,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(26),
              child: Text(
                "ساخت لیست جدید",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: SolidColors.txtBottomsheet),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: TextFormField(
              controller: dateController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: "انتخاب تاریخ",
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                  fillColor: SolidColors.bgTextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
              //readOnly: true,

              onTap: () {
                showDatePicker();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: TextFormField(
              controller: nameListController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: "لیست جدید",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: SolidColors.bgTextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: MaterialButton(
              onPressed: () {
                onAdd(ListModel(
                    date: dateController.toString(),
                    name: nameListController.text));
              },
              color: SolidColors.bgBtmAcceptList,
              minWidth: double.infinity,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: const Text(
                "ذخیره",
                style: TextStyle(
                    color: SolidColors.txtBtmAcceptList,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
 
}
 */
import 'package:flutter/material.dart';
import 'package:shopping_list/list_model.dart';
import 'package:persian_modal_date_picker/persian_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shopping_list/my_colors.dart';

class BottomSheetAddList extends StatefulWidget {
  final Function(ListModel shopping) onAdd;
  const BottomSheetAddList({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<BottomSheetAddList> createState() => _BottomSheetAddshoppingListtate();
}

class _BottomSheetAddshoppingListtate extends State<BottomSheetAddList> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameListController = TextEditingController();
  Date? selectedDate;

  String formatDate(Date? d) {
    if (d == null) return '';
    final formatter = d.formatter;
    return '${formatter.wN} ${formatter.d} ${formatter.mN} ${formatter.yyyy}';
  }

  void showDatePicker() async {
    await showPersianDatePicker(
      context,
      (context, Date date) async {
        setState(() {
          selectedDate = date;
          dateController.text = formatDate(selectedDate);
        });
        Navigator.of(context).pop();
      },
      yearDirection: YearDirection.both,
      border: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      ),
      validate: (ctx, date) {
        return date.year >= 1402;
      },
      submitButtonStyle: defaultButtonsStyle.copyWith(
        text: 'انتخاب',
        backgroundColor: Colors.blueAccent,
        radius: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: SolidColors.bgBtmsheet,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(26),
              child: Text(
                "ساخت لیست جدید",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: SolidColors.txtBottomsheet,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: TextFormField(
              controller: dateController,
              textAlign: TextAlign.right,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "انتخاب تاریخ",
                hintStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: SolidColors.bgTextfield,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: GestureDetector(
                  onTap: showDatePicker,
                  child: const Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: showDatePicker,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: TextFormField(
              controller: nameListController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: "لیست جدید",
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                filled: true,
                fillColor: SolidColors.bgTextfield,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: MaterialButton(
              onPressed: () {
                widget.onAdd(ListModel(
                  date: formatDate(selectedDate),
                  name: nameListController.text,
                ));
                Navigator.pop(context);
                setState(() {});
              },
              color: SolidColors.bgBtmAcceptList,
              minWidth: double.infinity,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const Text(
                "ذخیره",
                style: TextStyle(
                  color: SolidColors.txtBtmAcceptList,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
