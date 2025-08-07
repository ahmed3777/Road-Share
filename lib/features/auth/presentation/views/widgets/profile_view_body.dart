import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/widgets/custom_button.dart';
import 'package:roadshare/core/widgets/custom_check_box.dart';
import 'package:roadshare/core/widgets/custom_text_field.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';
import 'package:roadshare/features/auth/presentation/cubit/profile/profile_cubit.dart';
import 'package:roadshare/generated/l10n.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.user});

  final AppUser user;
  @override
  State<ProfileViewBody> createState() =>
      _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? selectedRole;
  bool isAvailable = false;

  // بيانات السيارة
  final carModelController = TextEditingController();
  final carPlateController = TextEditingController();
  final carColorController = TextEditingController();

  @override
  void initState() {
    _initializeFields();
    super.initState();
  }
  void _initializeFields() {
    if (widget.user.name != null) {
      nameController.text = widget.user.name!;
    }
    if (widget.user.email != null) {
      emailController.text = widget.user.email!;
    }
    if (widget.user.phone != null) {
      phoneController.text = widget.user.phone!;
    }
    selectedRole = widget.user.role;
    isAvailable = widget.user.isAvailable ?? false;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.largePadding(context)),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            CustomTextField(
              controller: nameController,
              hintText: widget.user.name ?? S.of(context).EnterYourName,
              validator: (val) {
                if (val!.isEmpty) {
                  return S.of(context).Name_required;
                }if (val.length < 3) {
                  return S.of(context).Name_must_be_at_least_3_characters;
                }
                return null;
              }
            ),
            SizedBox(height:AppDimensions.mediumSpacing(context)),
            CustomTextField(
              controller: emailController,
              hintText: widget.user.email ?? S.of(context).EnterYourEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val!.isEmpty) {
                  return S.of(context).Email_required;
              }
                if (val.length < 6) {
                  return S.of(context).Email_must_be_at_least_6_characters;
                }
                return null;
              },
            ),
            SizedBox(height:AppDimensions.mediumSpacing(context)),
            CustomTextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              hintText: widget.user.phone ?? S.of(context).EnterYourPhone,
              validator: (val) {
                if (val!.isEmpty) {
                  return S.of(context).Phone_required;
                }
                if (val.length < 11) {
                  return S.of(context).Phone_must_be_at_least_11_characters;
                }
                return null;
              }
            ),
            SizedBox(height:AppDimensions.mediumSpacing(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CustomCheckBox(
                    isChecked: isAvailable,
                    onChecked: (value) {
                      setState(() {
                        isAvailable = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                 Text(S.of(context).isAvailable),
              ],
            ),
            SizedBox(height: AppDimensions.mediumSpacing(context)),
            DropdownButtonFormField<String>(
              value: selectedRole,
              items:  [
                DropdownMenuItem(value: "rider", child: Text(S.of(context).rider)),
                DropdownMenuItem(value: "driver", child: Text(S.of(context).driver)),
              ],
              onChanged: (val) {
                if (val != null) setState(() => selectedRole = val);
              },
              decoration:  InputDecoration(
                labelText: S.of(context).SelectRole,
                border: OutlineInputBorder(),
              ),
            ),

            if (selectedRole=="driver")...[
              SizedBox(height: AppDimensions.mediumSpacing(context)),
              CustomTextField(
                controller: carModelController,
                hintText: "Car Model (مثال: Toyota Corolla 2020)",
                validator: (val) {
                  if (val!.isEmpty) return "Car model is required";
                  return null;
                },
              ),
               SizedBox(height: AppDimensions.mediumSpacing(context)),
              CustomTextField(
                controller: carPlateController,
                hintText: "Car Plate Number (مثال: س و ج 1234)",
                validator: (val) {
                  if (val!.isEmpty) return "Car plate number is required";
                  return null;
                },
              ),
               SizedBox(height: AppDimensions.mediumSpacing(context)),
              CustomTextField(
                controller: carColorController,
                hintText: "Car Color (مثال: Black)",
                validator: (val) {
                  if (val!.isEmpty) return "Car color is required";
                  return null;
                },
              )
            ],
             SizedBox(height: AppDimensions.largeSpacing(context)), 

            CustomButton(
              text: S.of(context).Continue,
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ProfileCubit>().updateProfile(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  isAvailable: isAvailable,
                  role: selectedRole,
                  carModel: carModelController.text ,
                  carPlate: carPlateController.text,
                  carColor: carColorController.text
                  
                 );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}