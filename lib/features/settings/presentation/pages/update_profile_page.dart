import 'package:flutter/material.dart';
import 'package:marketi/features/settings/presentation/widgets/update_profile_form.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UpdateProfileForm(),
        ),
      ),
    );
  }
}
