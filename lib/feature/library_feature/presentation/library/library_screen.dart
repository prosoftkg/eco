import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/filterList_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/errorInfo.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../widget/filterIcon.dart';
import 'bloc/library_bloc.dart';
import 'detail_screen/library_detail_screen.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController search = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  FilterList filterList=FilterList(filterTags: [], filterCat: [], filterType: [], filterTheme: [],search: '');
  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<LibraryBloc>()..add(GetLibraryEvent(filterList: filterList));

    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.library),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        actions: [filter(context,search.text)],
        leadingWidth: 100.w,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32).r,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
                color: AppColors.colorF7F7F7,
              ),
              child: Row(children: [
                InkWell(
                  onTap: (){
                    filterList.search=search.text;
                    BlocProvider.of<LibraryBloc>(context)
                        .add(GetLibraryEvent(filterList:filterList));
                  },
                    child: Image.asset('assets/icon/search.png',width: 20.w,height: 20.w)),
                SizedBox(width: 12.w),
                Flexible(
                  child: TextField(
                    style: AppTextStyles.hintStyle,
                    onTap: (){
                      BlocProvider.of<LibraryBloc>(context)
                          .add(SearchLibraryEvent(filterList:filterList));
                    },
                    controller: search,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Поиск',
                      hintStyle: AppTextStyles.hintStyle,
                    ),
                    focusNode: _focusNode,
                    onSubmitted: (value){
                      filterList.search=value;
                      search.text='';
                      BlocProvider.of<LibraryBloc>(context)
                          .add(GetLibraryEvent(filterList:filterList));
                    },
                  ),
                ),
              ])),
          SizedBox(height: 32.h),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, stateLan) {
              return BlocBuilder<LibraryBloc, LibraryState>(
                bloc: productBloc,
                builder: (context, state) {
                  if (state is LoadingLibraryState) {
                    return Center(child: progressWidget());
                  }
                  if (state is LoadedLibraryState) {
                    var lan = '';
                    filterList=state.filterList;
                    if (stateLan.lanCode != 'ru') {
                      lan = stateLan.lanCode;
                    }
                    print(lan);
                    return state.library.dataProvider.isNotEmpty ? Column(
                      children: [
                        for (var library in state.library.dataProvider)
                          Column(
                            children: [
                              InkWell(
                                onTap:(){
                                  /*BlocProvider.of<LibraryBloc>(context).add(
                                    DetailLibaryEvent(detailLibrary: library)
                                  );*/
                                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LibraryDetailScreen(detailLibrary: library)));
                    },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.color009D9B.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12).r,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 28,
                                        color: AppColors.color009D9B
                                            .withOpacity(0.08),
                                        offset: const Offset(0, 12),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          FutureBuilder(
                                            future: precacheImage(
                                                NetworkImage(library.picture!),
                                                context),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<void> snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                return Container(
                                                  width: 142.w,
                                                  height: 154.h,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.colorBlack,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12)).r,
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
                                                        library.picture!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else if (snapshot.hasError) {
                                                return const Text(
                                                    'Ошибка загрузки изображения');
                                              } else {
                                                return SizedBox(
                                                  width: 142.w,
                                                  height: 154.h,
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
                                              width: 142.w,
                                              padding: const EdgeInsets.all(5).r,
                                              decoration: BoxDecoration(
                                                color: AppColors.colorWhite
                                                    .withOpacity(0.4),
                                              ),
                                              child: Text(
                                                getTypeList(library.typeList),
                                                style: AppTextStyles
                                                    .clearSansS11clWhiteW700,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 12.w),
                                      SizedBox(
                                        width: 192.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 12.h),
                                            SizedBox(
                                              // width: 192.w,
                                              // height: 32.h,
                                              child: Text(
                                                  lan == ''
                                                      ? library.title!
                                                      : lan == 'en'
                                                          ? library.titleEn!
                                                          : library.titleKy!,
                                                  style: AppTextStyles
                                                      .clearSansMediumS13W500CBlack,overflow: TextOverflow.ellipsis,),
                                            ),
                                            SizedBox(height: 12.h),
                                            SizedBox(
                                                width: 188.w,
                                                child: Text(
                                                    lan == ''
                                                        ? library.description!
                                                        : lan == 'en'
                                                            ? library
                                                                .descriptionEn!
                                                            : library
                                                                .descriptionKy!,
                                                    style: AppTextStyles
                                                        .clearSansS12C82F400,overflow: TextOverflow.ellipsis)),
                                            SizedBox(height: 12.h),
                                            Wrap(
                                              spacing: 8.w,
                                              runSpacing: 5.h,
                                              children: [
                                                for (var catList
                                                    in library.catList)
                                                  IntrinsicWidth(
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2).r,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10).r,
                                                        color:
                                                            AppColors.color009D9B,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          catList.title!,
                                                          style: AppTextStyles
                                                              .clearSansMediumS12W500CWhite,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 32.h)
                            ],
                          ),
                      ],
                    ) : Center(child: Text('No product'));

                    /*GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: library.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.network(library[index].picture!,loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: progressWidget(),
                                );
                              },),
                            ),
                            Text(lan=='' ? library[index].title! : lan=='en' ? library[index].titleEn! : library[index].titleKy!),
                          ],
                        ),

                      );
                    });*/
                  }
                  if(state is LoadedRemoveHistoryState){
                    BlocProvider.of<LibraryBloc>(context)
                        .add(SearchLibraryEvent(filterList:filterList));
                  }
                  if (state is LoadedSearchLibraryState) {
                    var lan = '';
                    filterList=state.filterList;
                    if (stateLan.lanCode != 'ru') {
                      lan = stateLan.lanCode;
                    }
                    print(lan);
                    return WillPopScope(
                      onWillPop: () async{
                        print('willScope');
                        BlocProvider.of<LibraryBloc>(context)
                            .add(GetLibraryEvent(filterList:filterList));
                        return true;
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Последние поиски',style: AppTextStyles.clearSansMediumS14C82F500),
                            InkWell(child: Text('Очистить все',style: AppTextStyles.clearSansMediumS14W500C009D9B,),onTap: (){
                              BlocProvider.of<LibraryBloc>(context)
                                  .add(RemoveHistoryLibraryEvent(filterList:filterList, remove: 'removeAll'));
                            },)
                          ],),
                          SizedBox(height: 22.h),
                          for (var history in state.historySearch)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(onTap: (){
                                      filterList.search=history;
                                      BlocProvider.of<LibraryBloc>(context)
                                          .add(GetLibraryEvent(filterList:filterList));
                                    },child: Text(history,style: AppTextStyles.clearSansS14CBlackF400)),
                                    InkWell(
                                      onTap: (){
                                        BlocProvider.of<LibraryBloc>(context)
                                            .add(RemoveHistoryLibraryEvent(filterList: filterList, remove: history));
                                        // Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/icon/close-square.png',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 32.h)
                              ],
                            ),
                        ],
                      ),
                    );

                    /*GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: library.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.network(library[index].picture!,loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: progressWidget(),
                                );
                              },),
                            ),
                            Text(lan=='' ? library[index].title! : lan=='en' ? library[index].titleEn! : library[index].titleKy!),
                          ],
                        ),

                      );
                    });*/
                  }
                  if (state is ErrorLibraryState) {
                    return errorWidget(context);
                  }
                  return Container();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
