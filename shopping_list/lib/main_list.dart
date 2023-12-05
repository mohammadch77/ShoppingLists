import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/list_model.dart';
import 'package:shopping_list/my_colors.dart';
import 'add_item_list.dart';
import 'bottomsheet_add_list.dart';
import 'bottomsheet_option_list.dart';

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainshoppingListtate();
}

class _MainshoppingListtate extends State<MainList> {
  int? selectedItemIndex;
  void removeItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
       print('Item at index $index removed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.bgMain,
      //appBar
      appBar: AppBar(
        elevation: 2,
        backgroundColor: SolidColors.bgAppbar,
        title: const Text(
          "لیست من",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: SolidColors.txtAppbar),
        ),
        leading: const Icon(
          Icons.menu,
          color: SolidColors.iconAppbar,
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: SolidColors.iconAppbar,
          )
        ],
      ),
      body: Stack(
        children: [
          //bgImage

          SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItemIndex = index;
                      print('Selected item index set to $index');
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddItemList(),
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        color: SolidColors.bgList,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shoppingList[index].name,
                                  style: const TextStyle(
                                      color: SolidColors.txtList,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  shoppingList[index].date,
                                  style: const TextStyle(
                                      color: SolidColors.txtList,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => BottomSheetOptionList(
                                  index: index,
                                  onRemove: (int index) {
                                   if (index == selectedItemIndex) {
                                  removeItem(index); // حذف آیتم انتخاب شده
                                 
                                   print('Selected item index set to null');
                                }

                                    Navigator.pop(context);
                                  },
                                   selectedItemIndex: selectedItemIndex,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.more_vert,
                              color: SolidColors.iconList,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: MaterialButton(
        color: SolidColors.bgNavigationBtm,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheetAddList(
              onAdd: (shopping) {
                shoppingList.add(shopping);
                setState(() {});
              },
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          );
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.plus,
              color: SolidColors.iconNavigationBtm,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "افزودن",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: SolidColors.txtNavigationBtm),
            )
          ],
        ),
      ),
    ));
  }
}
