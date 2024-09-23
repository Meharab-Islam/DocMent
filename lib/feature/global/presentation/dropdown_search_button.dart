import 'package:docment/core/widget/text_style.dart';
import 'package:docment/feature/global/domain/dropdown_search_button_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DropDownField extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(String?) onItemSelected;

  DropDownField({
    super.key,
    required this.title,
    required this.items,
    required this.onItemSelected,
  }) {
    // Register a new instance of DropDownController for this widget
    Get.create(() => DropDownController());
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the controller instance using Get.find()
    final DropDownController dropDownController =
        Get.find<DropDownController>();

    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2<String>(
            isExpanded: true,
            hint: inputText(
              text: title,
            ),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: inputText(text: item),
                    ))
                .toList(),
            // Listen to changes in selectedValue using Obx
            value: dropDownController.selectedValue.value!.isEmpty
                ? null
                : dropDownController
                    .selectedValue.value, // Ensure it handles the null case
            onChanged: (value) {
              dropDownController.updateSelectedValue(value);
              onItemSelected(value); // Return the selected value via callback
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 35.h,
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
              iconEnabledColor: const Color.fromARGB(255, 126, 126, 126),
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 30.h,
            ),
            dropdownSearchData: DropdownSearchData(
              searchController: dropDownController.searchController,
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
                  controller: dropDownController.searchController,
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
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                dropDownController
                    .clearSearch(); // Clear search input when menu closes
              }
            },
          )),
    );
  }
}
