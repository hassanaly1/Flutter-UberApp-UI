import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text_field.dart';

class AdminRegistrationScreen extends StatefulWidget {
  const AdminRegistrationScreen({Key? key}) : super(key: key);

  @override
  _AdminRegistrationScreenState createState() =>
      _AdminRegistrationScreenState();
}

class _AdminRegistrationScreenState extends State<AdminRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      }
    });
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Registration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                  controller: _nameController,
                  name: 'Name',
                  hintText: 'Name',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 16.0),
              CustomTextField(
                  controller: _emailController,
                  name: 'Email',
                  hintText: 'Enter your Email',
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16.0),
              CustomTextField(
                  controller: _phoneController,
                  name: 'Phone Numbber',
                  hintText: 'Enter your Phone Number',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16.0),
              CustomTextField(
                  controller: _passwordController,
                  name: 'Password',
                  hintText: 'Password',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 40.0),
              CustomButton(
                buttonText: 'Register Admin',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
