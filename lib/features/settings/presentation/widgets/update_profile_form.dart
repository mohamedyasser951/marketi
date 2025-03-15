import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/helper/image_picker_helper.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:marketi/features/settings/presentation/widgets/update_profile_bloc_listener.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  late GlobalKey<FormState> formKey;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  File? _selectedImage;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _nameController = TextEditingController(
      text: BlocProvider.of<ProfileCubit>(context).state.userProfileModel?.name,
    );
    _emailController = TextEditingController(
      text:
          BlocProvider.of<ProfileCubit>(context).state.userProfileModel?.email,
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10.h,
        children: [
          UpdateProfileBlocListener(),
          GestureDetector(
            onTap:
                () => ImagePickerHelper.showOption(
                  context: context,
                  onGet: (image) {
                    setState(() {
                      _selectedImage = image;
                    });
                  },
                ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
                  _selectedImage != null ? FileImage(_selectedImage!) : null,
              child:
                  _selectedImage == null
                      ? const Icon(Icons.camera_alt, size: 50)
                      : null,
            ),
          ),
          const SizedBox(height: 20),
          AppTextFileld(
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            textInputType: TextInputType.name,
            prefixIcon: Icons.person,
            hint: 'Name',
          ),
          AppTextFileld(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            hint: 'Email',
          ),
          AppButton(
            btnText: 'Update',
            onPress: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ProfileCubit>(context).updateProfile(
                  _nameController.text,
                  _emailController.text,
                  _selectedImage,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
