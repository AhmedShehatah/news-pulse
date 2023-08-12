import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/blocs/news/news_bloc.dart';
import 'package:news_pulse/blocs/news/news_state.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/image_type_enum.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/utils/attachments/attachments_utils.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/core/validators/required_validator.dart';
import 'package:news_pulse/ui/global_widgets/default_button.dart';
import 'package:news_pulse/ui/global_widgets/text_field_widget.dart';

import '../../../data/models/news_model.dart';

class AddNewsPage extends StatefulWidget {
  const AddNewsPage({super.key});
  static const String routName = "/add-news-page";

  @override
  State<AddNewsPage> createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  NewsModel newsModel = NewsModel();
  final _key = GlobalKey<FormState>();
  final _fieldColors = DIManager.findCC().fieldsFillColor;
  final margin = Dimens.smallVerticalPadding;
  File? _image;

  void pickImage() async {
    _image = await DIManager.findDep<AttachemntUtils>()
        .getOneImage(ImageTypeEnum.GALLERY);
    if (_image != null) {
      DIManager.findDep<NewsCubit>().uploadImage(_image!);
    }
  }

  Widget _buildImagePicker() {
    return BlocBuilder<NewsCubit, NewsState>(
      bloc: DIManager.findDep<NewsCubit>(),
      builder: (context, state) {
        var isImageLoading = state.uploadImage is BaseLoadingState;
        var isImageLoaded = state.uploadImage is BaseSuccessState;

        return InkWell(
          onTap: () {
            if (isImageLoading) return;

            pickImage();
          },
          child: Container(
              decoration: BoxDecoration(
                image: isImageLoaded
                    ? DecorationImage(
                        fit: BoxFit.cover, image: FileImage(_image!))
                    : null,
                borderRadius: BorderRadius.circular(20),
                color: _fieldColors,
              ),
              height: ScreenHelper.fromHeight(30),
              width: ScreenHelper.width,
              child: isImageLoading
                  ? const Center(child: CircularProgressIndicator())
                  : !isImageLoaded
                      ? const Center(child: Text("Upload Image"))
                      : null),
        );
      },
    );
  }

  void add() {
    if (_key.currentState?.validate() ?? false) {
      newsModel.content = _contentTextController.text;
      newsModel.title = _titleController.text;
      //newsModel.image = _image;
      DIManager.findDep<NewsCubit>().createNews(newsModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().lightgreyBackground,
      body: Container(
        margin: Dimens.itemHorizontalPadding_6,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalPadding(1),
                _buildImagePicker(),
                TextFieldWidget(
                    warningColor: DIManager.findCC().black,
                    margin: margin,
                    fillColor: _fieldColors,
                    isLabeled: false,
                    textController: _titleController,
                    label: "Title",
                    hint: "Add Title",
                    validators: [RequiredValidator()]),
                TextFieldWidget(
                    warningColor: DIManager.findCC().black,
                    margin: margin,
                    fillColor: _fieldColors,
                    isLabeled: false,
                    textController: _contentTextController,
                    label: "News Body",
                    hint: "Start Typing ...",
                    minLine: 15,
                    maxLine: 20,
                    validators: [RequiredValidator()]),
                BlocBuilder<NewsCubit, NewsState>(
                    bloc: DIManager.findDep<NewsCubit>(),
                    builder: (context, state) {
                      bool isLoading =
                          state.createNewsState is BaseLoadingState;
                      return DefaultButton(
                          margin: null,
                          buttonText: "ADD",
                          onPressed: add,
                          isLoading: isLoading);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  //@override
  // void dispose() {
  //   super.dispose();
  //   _contentTextController.dispose();
  //   _contentTextController.dispose();
  // }
}
