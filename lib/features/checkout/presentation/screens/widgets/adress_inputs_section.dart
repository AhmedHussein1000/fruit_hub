import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class AdressInputsSection extends StatefulWidget {
  const AdressInputsSection(
      {super.key,
      required this.formKey,
      required this.valueNotifierAutovalidateMode});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueNotifierAutovalidateMode;

  @override
  State<AdressInputsSection> createState() => _AdressInputsSectionState();
}

class _AdressInputsSectionState extends State<AdressInputsSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var shippingAddressEntity =
        context.read<OrderEntity>().shippingAddressEntity;
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.valueNotifierAutovalidateMode,
        builder: (context, value, child) => Form(
          key: widget.formKey,
          autovalidateMode: value,
          child: Column(
            spacing: 8.h,
            children: [
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormField(
                hintText: S.of(context).fullName,
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  shippingAddressEntity.name = value;
                },
              ),
              CustomTextFormField(
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  shippingAddressEntity.email = value;
                },
              ),
              CustomTextFormField(
                hintText: S.of(context).address,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  shippingAddressEntity.address = value;
                },
              ),
              CustomTextFormField(
                hintText: S.of(context).city,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  shippingAddressEntity.city = value;
                },
              ),
              CustomTextFormField(
                hintText: S.of(context).floor_and_apartment,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  shippingAddressEntity.floorAndApartment = value;
                },
              ),
              CustomTextFormField(
                hintText: S.of(context).phone,
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  shippingAddressEntity.phone = value;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
