import 'package:flutter/material.dart';
import 'package:shopping_list/my_colors.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class AddItemList extends StatefulWidget {
  const AddItemList({super.key});

  @override
  State<AddItemList> createState() => _AddItemshoppingListtate();
}

class _AddItemshoppingListtate extends State<AddItemList> {
  String searchvalue = '';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.bgMain,
      appBar: EasySearchBar(
        backgroundColor: Colors.white,
        searchBackgroundColor: Colors.white,
        title: Text("test"),
        onSearch: (value) {
          setState(() {
            searchvalue = value;
          });
        },
        suggestions: _suggestions,
      ),
      body: SizedBox(
        height: 100,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: double.infinity,
              child: Text(searchvalue),
            );
          },
        ),
      ),
    ));
  }
}
