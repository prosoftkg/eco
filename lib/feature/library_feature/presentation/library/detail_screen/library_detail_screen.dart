import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/app_text_styles.dart';
import '../../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../../splash_feature/presentation/bloc/language_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryDetailScreen extends StatefulWidget {
  final DataProvider detailLibrary;
  const LibraryDetailScreen({super.key, required this.detailLibrary});

  @override
  State<LibraryDetailScreen> createState() => _LibraryDetailScreenState();
}

class _LibraryDetailScreenState extends State<LibraryDetailScreen> {

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.library),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
  builder: (context, stateLan) {
      var lan = '';
      if (stateLan.lanCode != 'ru') {
        lan = stateLan.lanCode;
      }
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: [
          /*Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.colorF7F7F7,
              ),
              child: Row(children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.search,
                    color: AppColors.color828282,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 84,
                  child: TextField(
                    controller: search,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Поиск',
                      hintStyle: AppTextStyles.hintStyle,
                    ),
                  ),
                ),
              ])),
          SizedBox(height: 32),*/
          Text(lan == ''
              ? widget.detailLibrary.title!
              : lan == 'en'
              ? widget.detailLibrary.titleEn!
              : widget.detailLibrary.titleKy!,style: AppTextStyles.clearSansMediumS13W500CBlack),
          SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 5,
            children: [
              for (var catList
              in widget.detailLibrary.catList)
                Container(
                  width: 83,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                        10),
                    color:
                    AppColors.color009D9B,
                  ),
                  child: Center(
                    child: Text(
                      catList.title ??
                          'менеджмент',
                      style: AppTextStyles
                          .clearSansMediumS12W500CWhite,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 22),
          Stack(
            children: [
              FutureBuilder(
                future: precacheImage(
                    NetworkImage(widget.detailLibrary.picture!),
                    context),
                builder: (BuildContext context,
                    AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.done) {
                    return Container(
                      height: 222,
                      decoration: BoxDecoration(
                        color: AppColors.colorBlack,
                        borderRadius:
                        BorderRadius.circular(12),
                        image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(
                              Colors
                                  .white
                                  .withOpacity(
                                  0.7),
                              BlendMode.modulate),
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.detailLibrary.picture!,
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                        context.text.imageLoadError);
                  } else {
                    return SizedBox(
                      width: 142,
                      height: 154,
                      child: Center(
                        child: progressWidget(),
                      ),
                    );
                  }
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width-32,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite
                        .withOpacity(0.4),
                  ),
                  child: Text(
                    // 'Гостиница/отель/Гостевой дом'
                    getTypeList(widget.detailLibrary.typeList),
                    style: AppTextStyles
                        .clearSansS11clWhiteW700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(lan == ''
              ? fromHtml(widget.detailLibrary.text!)
              : lan == 'en'
              ? fromHtml(widget.detailLibrary
              .textEn!)
              : fromHtml(widget.detailLibrary
              .textKy!),style: AppTextStyles.clearSansS13W400CBlack),
          SizedBox(height: 22),
          Text(
              lan == ''
                  ? widget.detailLibrary.description!
                  : lan == 'en'
                  ? widget.detailLibrary
                  .descriptionEn!
                  : widget.detailLibrary
                  .descriptionKy!,
              style: AppTextStyles
                  .clearSansS12C82F400),
          SizedBox(height: 12),
          Row(
            children: [
              Text('Тема: ',style:  AppTextStyles.clearSansS12W400CBlack),
              for(var item in widget.detailLibrary.themeList)
                Text(item.title!,style:  AppTextStyles.clearSansS12C009D9BF400)

            ],
          )

        ],
      );
  },
)
    );

  }
  String fromHtml(String htmlString){
    String fromHtmlString = htmlString.replaceAll('</p>', '\n\n');
    fromHtmlString=fromHtmlString.replaceAll('<p>', '');
    return fromHtmlString;
  }

}
