import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:news_pulse/blocs/news/news_bloc.dart';
import 'package:news_pulse/core/constants/app_style.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/ui/global_widgets/default_button.dart';
import '../../../blocs/news/news_state.dart';
import '../../core/enums/image_type_enum.dart';
import '../../core/utils/attachments/attachments_utils.dart';

// ignore: must_be_immutable
class PublisherShowNewsPage extends StatefulWidget {
  const PublisherShowNewsPage({
    super.key,
  });
  static const String routeName = "/publisher-show-news-page";

  @override
  State<PublisherShowNewsPage> createState() => _PublisherShowNewsPageState();
}

class _PublisherShowNewsPageState extends State<PublisherShowNewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;
  File? _image;

  void pickImage() async {
    _image = await DIManager.findDep<AttachemntUtils>()
        .getOneImage(ImageTypeEnum.GALLERY);
    if (_image != null) {
      DIManager.findDep<NewsCubit>().uploadImage(_image!);
    }
  }

  Widget _buildButtons(NewsModel model) {
    return BlocBuilder<NewsCubit, NewsState>(
        bloc: DIManager.findDep<NewsCubit>(),
        builder: (context, state) {
          var deleteNews = state.deleteNews;
          var editNews = state.updateNews;
          var isDeleting = deleteNews is BaseLoadingState;
          var isEditing = editNews is BaseLoadingState;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DefaultButton(
                  buttonText: "Edit",
                  onPressed: () {
                    if (isEditing) return;
                    DIManager.findDep<NewsCubit>().editNews(model);
                  },
                  isLoading: isEditing),
              DefaultButton(
                  buttonText: "Delete",
                  onPressed: () {
                    if (isDeleting) return;
                    DIManager.findDep<NewsCubit>().deleteNews(model.id!);
                  },
                  isLoading: isDeleting)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().lightgreyBackground,
      body: BlocBuilder<NewsCubit, NewsState>(
        bloc: DIManager.findDep<NewsCubit>(),
        builder: (context, state) {
          var uploadState = state.uploadImage;
          var showState = state.showNewsState;
          if (showState is BaseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (showState is BaseFailState) {
            return const Center(
              child: Text("Error! please Try again later",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 183, 15, 3))),
            );
          } else if (showState is BaseSuccessState) {
            var news = showState.data as NewsModel;

            _titleController.text = news.title!;
            _contentController.text = news.content!;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (uploadState is BaseLoadingState) return;

                          pickImage();
                        },
                        child: Container(
                          color: Colors.amber,
                          //  width: ScreenHelper.width,
                          child: _image == null
                              ? CachedNetworkImage(
                                  imageUrl: news.imageUrl!,
                                  fit: BoxFit.fill,
                                  width: ScreenHelper.width,
                                )
                              : Image.file(_image!),
                        ),
                      ),
                      Padding(
                        padding: Dimens.cardInternalPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  news.publisher!,
                                  style: AppStyle.text14Style,
                                ),
                                Text(
                                    DateFormat("EEEE, MM, dd")
                                        .format(news.createdAt!),
                                    style: AppStyle.text14Style),
                              ],
                            ),
                            const VerticalPadding(1.5),
                            EditableText(
                              onChanged: (text) {
                                news.title = text;
                              },
                              controller: _titleController,
                              focusNode: _node1,
                              cursorColor: Colors.black,
                              backgroundCursorColor: Colors.white,
                              // onEditingComplete: () {},
                              style: AppStyle.bigTitleStyle,
                            ),
                            const VerticalPadding(1.5),
                            EditableText(
                              onChanged: (text) {
                                news.content = text;
                              },
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              controller: _contentController,
                              style: AppStyle.text14Style,
                              focusNode: _node2,
                              cursorColor: Colors.black,
                              backgroundCursorColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      //  isVisibleKeyboard
                      //   _buildButtons(news):
                      const VerticalPadding(30)
                    ],
                  ),
                ),
                isVisibleKeyboard ? const SizedBox() : _buildButtons(news)
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  bool isVisibleKeyboard = false;
  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        Logger().d(visible);
        isVisibleKeyboard = visible;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)!.settings.arguments as String;
    DIManager.findDep<NewsCubit>().showNews(id);
  }
}
