import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppoinmentDropDownField extends StatefulWidget {
  const AppoinmentDropDownField({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  State<AppoinmentDropDownField> createState() => _AppoinmentDropDownFieldState();
}

class _AppoinmentDropDownFieldState extends State<AppoinmentDropDownField> {
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
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14.sp,
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
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(255, 187, 187, 187),
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
                hintStyle: TextStyle(fontSize: 14.sp),
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
