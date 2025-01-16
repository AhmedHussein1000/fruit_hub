import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/generated/l10n.dart';

class AdressInputsSection extends StatefulWidget {
  const AdressInputsSection({super.key});

  @override
  State<AdressInputsSection> createState() => _AdressInputsSectionState();
}

class _AdressInputsSectionState extends State<AdressInputsSection> {
  late final TextEditingController nameController,
      emailController,
      addressController,
      cityController,
      floorAndApartmentController,
      phoneController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    floorAndApartmentController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    floorAndApartmentController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8.h,
        children: [
           SizedBox(
            height: 16.h,
          ),
          CustomTextFormField(
            controller: nameController,
            hintText: S.of(context).fullName,
            keyboardType: TextInputType.name,
          ),
          CustomTextFormField(
            controller: emailController,
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
              controller: addressController,
              hintText: S.of(context).address,
              keyboardType: TextInputType.text),
          CustomTextFormField(
              controller: cityController,
              hintText: S.of(context).city,
              keyboardType: TextInputType.text),
          CustomTextFormField(
              controller: floorAndApartmentController,
              hintText: S.of(context).floor_and_apartment,
              keyboardType: TextInputType.text),
          CustomTextFormField(
            controller: phoneController,
            hintText: S.of(context).phone,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
