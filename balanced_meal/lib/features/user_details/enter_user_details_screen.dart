import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/core/widgets/app_text_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterUserDetailsScreen extends StatefulWidget {
  const EnterUserDetailsScreen({super.key});

  @override
  State<EnterUserDetailsScreen> createState() => _EnterUserDetailsScreenState();
}

class _EnterUserDetailsScreenState extends State<EnterUserDetailsScreen> {
  static const List<String> gender = ['Male', 'Female'];
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Color(0xff1E1E1E)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Enter Your Details",
          style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.0.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gender",
                  style: TextStyles.font14LightBlackMedium.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField2<String>(
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  selectedItemBuilder: (BuildContext context) {
                    return gender.map<Widget>((String item) {
                      return Text(
                        item,
                        style: TextStyles.font16LightBlackMedium.copyWith(
                          fontFamily: 'poppins',
                        ),
                      );
                    }).toList();
                  },
                  items:
                      gender
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      selectedGender == item
                                          ? Color(0xffFFEDE3)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'poppins',
                                        color: Colors.black87,
                                        fontWeight:
                                            selectedGender == item
                                                ? FontWeight.w500
                                                : FontWeight.normal,
                                      ),
                                    ),
                                    if (selectedGender == item)
                                      const Icon(
                                        Icons.check,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorsManager.midGray,
                    ),
                    iconSize: 28,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    offset: const Offset(0, -5),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: ColorsManager.lightGray,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: ColorsManager.lightGray,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: ColorsManager.mainOrange,
                        width: 1.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  hint: Text(
                    'Choose your gender',
                    style: TextStyles.font16MidGrayRegular.copyWith(
                      fontFamily: 'questrial',
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Weight",
                  style: TextStyles.font14LightBlackMedium.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10.h),
                AppTextFormField(
                  hintText: 'Enter your weight',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      widthFactor: 1.0,
                      child: Text(
                        'Kg',
                        style: TextStyles.font14LightBlackMedium.copyWith(
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Height",
                  style: TextStyles.font14LightBlackMedium.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10.h),
                AppTextFormField(
                  hintText: 'Enter your height',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      widthFactor: 1.0,
                      child: Text(
                        'Cm',
                        style: TextStyles.font14LightBlackMedium.copyWith(
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Age",
                  style: TextStyles.font14LightBlackMedium.copyWith(
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10.h),
                AppTextFormField(hintText: 'Enter your age'),
                SizedBox(height: 250.h),
                AppTextButton(
                  text: 'Next',
                  onPressed: () {Navigator.pushNamed(
                    context,
                    'createOrderScreen',
                  );},
                  color: ColorsManager.mainOrange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
