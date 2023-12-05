import 'package:flutter/material.dart';
import 'package:shopping_list/my_colors.dart';

class BottomSheetOptionList extends StatefulWidget {
  final int index;
  final Function(int) onRemove;
   final int? selectedItemIndex;
  const BottomSheetOptionList({
    super.key,
    required this.index,
    required this.onRemove, this.selectedItemIndex,
  });

  @override
  State<BottomSheetOptionList> createState() {
    return _BottomSheetOptionshoppingListtate();
  }
}

class _BottomSheetOptionshoppingListtate extends State<BottomSheetOptionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: SolidColors.bgBtmsheet,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 26, 26, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "مدیریت لیست ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: SolidColors.txtBottomsheet),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.close,
                    color: SolidColors.iconBottomsheet,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
            child: Divider(
              height: 0.5,
              thickness: 2,
              color: Colors.yellow,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 15, 26, 10),
            //color: Colors.black,
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                  color: SolidColors.iconBottomsheet,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "تغییر نام",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: SolidColors.txtBottomsheet),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 26, 10),
            //color: Colors.black,
            child: const Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  color: SolidColors.iconBottomsheet,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "اشتراک گذاری",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: SolidColors.txtBottomsheet,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 26, 10),
            //color: Colors.black,
            child: InkWell(
              onTap: () {
                
                if (widget.index == widget.selectedItemIndex) {
                   print("Selected item index: ${widget.selectedItemIndex}");
                  widget.onRemove(widget.index);
                  
                }
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    " حذف",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          /* Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 26, 10),
            //color: Colors.black,
            child: const Row(
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  " حذف",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
          ), */
        ],
      ),
    );
  }
}
