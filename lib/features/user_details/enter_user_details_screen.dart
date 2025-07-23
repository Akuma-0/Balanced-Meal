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
  int? age, height, weight;
  String? selectedGender;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: null,
        title: Text(
          "Enter Your Details",
          style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.0.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyles.font14LightBlackMedium.copyWith(
                          fontFamily: 'Poppins',
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
                                fontFamily: 'Poppins',
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
                                              fontFamily: 'Poppins',
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
                          fontFamily: 'Poppins',
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
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              weight = int.tryParse(val);
                            });
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your weight.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Height",
                        style: TextStyles.font14LightBlackMedium.copyWith(
                          fontFamily: 'Poppins',
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
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              height = int.tryParse(val);
                            });
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your height.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Age",
                        style: TextStyles.font14LightBlackMedium.copyWith(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppTextFormField(
                        hintText: 'Enter your age',
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              age = int.tryParse(val);
                            });
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your age.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: AppTextButton(
              text: 'Next',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  int calories;
                  if (selectedGender == 'Male') {
                    calories =
                        ((666.47) +
                                (13.75 * weight!) +
                                (5 * height!) -
                                (6.75 * age!))
                            .toInt();
                  } else {
                    calories =
                        ((655.1) +
                                (9.56 * weight!) +
                                (1.85 * height!) -
                                (4.67 * age!))
                            .toInt();
                  }
                  Navigator.pushNamed(
                    context,
                    'createOrderScreen',
                    arguments: calories,
                  );
                }
              },
              color:
                  (height != null &&
                          weight != null &&
                          age != null &&
                          selectedGender != null)
                      ? ColorsManager.mainOrange
                      : ColorsManager.lightGray,
              textColor:
                  (height != null &&
                          weight != null &&
                          age != null &&
                          selectedGender != null)
                      ? Colors.white
                      : ColorsManager.midGray,
            ),
          ),
        ],
      ),
    );
  }
}
