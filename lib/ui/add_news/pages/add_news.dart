import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/validators/required_validator.dart';
import 'package:news_pulse/ui/global_widgets/text_field_widget.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key});
  static const String routName = "/add-news-page";

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  File? _image;
  void imagePicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = File(image.path);
    });
  }

  Widget _buildImagePicker() {
    return InkWell(
      onTap: imagePicker,
      child: Container(
          decoration: BoxDecoration(
            image: _image != null
                ? DecorationImage(
                    invertColors: true,
                    //filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: FileImage(_image!))
                : null,
            borderRadius: BorderRadius.circular(20),
            color: DIManager.findCC().darkGreyBorderColor,
          ),
          height: ScreenHelper.fromHeight(30),
          width: ScreenHelper.width,
          // color: DIManager.findCC().darkGreyBorderColor,
          child:
              _image == null ? const Center(child: Text("Pick Image")) : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        //TODO: Add color to APPCOLORS
        backgroundColor: const Color.fromARGB(
            255, 223, 220, 220), //DIManager.findCC().primaryColor,
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImagePicker(),
              TextFieldWidget(
                  fieldIcon: const Icon(Icons.abc),
                  textController: _titleController,
                  label: "Title",
                  hint: "Add Title",
                  validators: [RequiredValidator()]),
              TextFieldWidget(
                  fieldIcon: const Icon(Icons.abc),
                  textController: _titleController,
                  label: "News Body",
                  hint: "Hey",
                  validators: [RequiredValidator()]),
            ],
          ),
        ));
  }

  var _data;

  void test() async {
    {
      _data = FormData.fromMap({
        'files': [
          await MultipartFile.fromFile(_image!.path, filename: "tester")
        ],
      });
    }
  }
}
