import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  // final List<String> items = [
  //   'A_Item1',
  //   'A_Item2',
  //   'A_Item3',
  //   'A_Item4',
  //   'B_Item1',
  //   'B_Item2',
  //   'B_Item3',
  //   'B_Item4',
  //   "kader",
  //   "korim",
  //   "Nibir",
  //   "Meharab",
  // ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,

        hint: Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            color: Colors.white,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 34.sp,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200.h,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 30.h,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 40.h,
          searchInnerWidget: Container(
            height: 45.h,
            padding: EdgeInsets.only(
              top: 8.sp,
              bottom: 4.sp,
              right: 8.sp,
              left: 8.sp,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 8,
                ),
                hintText: 'Search for an item...',
                hintStyle: TextStyle(fontSize: 20.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
