import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/filterList_entity.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/select_entity.dart';
import 'package:flutter/material.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/errorInfo.dart';
import '../../../auth_feature/presentation/widgets/checkContainer.dart';
import '../../../auth_feature/presentation/widgets/unCheck.dart';
import '../../domain/entities/param_entity.dart';
import '../filter/bloc/filter_bloc.dart';
import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../library/bloc/library_bloc.dart';

Widget filter(BuildContext context, String search) {
  Set<String> filterCat = {};
  Set<String> filterType = {};
  Set<String> filterTags = {};
  Set<String> filterTheme = {};
  return Padding(
    padding: const EdgeInsets.only(right: 16).r,
    child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  surfaceTintColor: AppColors.colorWhite,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, stateLan) {
                        return BlocBuilder<FilterBloc, FilterState>(
                          bloc: BlocProvider.of<FilterBloc>(context)
                            ..add(GetParamEvent(lanCode: stateLan.lanCode)),
                          builder: (context, state) {
                            if (state is LoadingFilterState) {
                              return Center(child: progressWidget());
                            }
                            if (state is LoadedFilterState) {
                              final ParamEntity param = state.param;
                              if (state.selectFilters.category != '') {
                                filterCat.add(state.selectFilters.category);
                              }
                              filterCat.remove(state.removeFilters.category);
                              if (state.selectFilters.type != '') {
                                filterType.add(state.selectFilters.type);
                              }
                              filterType.remove(state.removeFilters.type);
                              if (state.selectFilters.tags != '') {
                                filterTags.add(state.selectFilters.tags);
                              }
                              filterTags.remove(state.removeFilters.tags);
                              if (state.selectFilters.theme != '') {
                                filterTheme.add(state.selectFilters.theme);
                              }
                              filterTheme.remove(state.removeFilters.theme);
                              return ListView(
                                padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 22)
                                    .r,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Text('Фильтр',
                                          style: AppTextStyles
                                              .clearSansMediumTextStyle16),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          'assets/icon/close-square.png',
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22.h),
                                  Text(context.text.type,
                                      style: AppTextStyles.clearSansS16cl82),
                                  SizedBox(height: 10.h),
                                  Column(
                                      children: param.type.entries
                                          .map((e) => Column(
                                                children: [
                                                  filterType.contains(e.key)
                                                      ? InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(UnSelectParamEvent(
                                                                  unSelect: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags: '',
                                                                      theme: '',
                                                                      type: e
                                                                          .key),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              checkContainer(),
                                                              SizedBox(
                                                                  width: 10.h),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(SelectParamEvent(
                                                                  select: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags: '',
                                                                      theme: '',
                                                                      type: e
                                                                          .key),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              unCheckContainer(),
                                                              SizedBox(
                                                                  width: 10.h),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        ),
                                                  SizedBox(height: 10.h),
                                                ],
                                              ))
                                          .toList()),
                                  SizedBox(height: 22.h),
                                  Text(context.text.category,
                                      style: AppTextStyles.clearSansS16cl82),
                                  SizedBox(height: 10.h),
                                  Wrap(
                                      spacing: 8.w,
                                      runSpacing: 5.h,
                                      children: param.category.entries
                                          .map((e) => filterCat.contains(e.key)
                                              ? IntrinsicWidth(
                                                  child: InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                          FilterBloc>(context)
                                                        .add(UnSelectParamEvent(
                                                            unSelect:
                                                                SelectEntity(
                                                                    category:
                                                                        e.key,
                                                                    tags: '',
                                                                    theme: '',
                                                                    type: ''),
                                                            paramEntity:
                                                                state.param));
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2).r,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        10)
                                                                .r,
                                                        color: AppColors
                                                            .color009D9B,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          e.value,
                                                          style: AppTextStyles
                                                              .clearSansMediumS12W500CWhite,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : IntrinsicWidth(
                                                  child: InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                          FilterBloc>(context)
                                                        .add(SelectParamEvent(
                                                            select:
                                                                SelectEntity(
                                                                    category:
                                                                        e.key,
                                                                    tags: '',
                                                                    theme: '',
                                                                    type: ''),
                                                            paramEntity:
                                                                state.param));
                                                    },
                                                    child: IntrinsicWidth(
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2).r,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                      .circular(
                                                                          10)
                                                                  .r,
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .color009D9B,
                                                              width: 1.w),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            e.value,
                                                            style: AppTextStyles
                                                                .clearSansMediumS12W500C009D9B,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          .toList()),
                                  SizedBox(height: 22.h),
                                  Text(context.text.tags,
                                      style: AppTextStyles.clearSansS16cl82),
                                  SizedBox(height: 10.h),
                                  Column(
                                      children: param.tags.entries
                                          .map((e) => Column(
                                                children: [
                                                  filterTags.contains(e.key)
                                                      ? InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(UnSelectParamEvent(
                                                                  unSelect: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags:
                                                                          e.key,
                                                                      theme: '',
                                                                      type: ''),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              checkContainer(),
                                                              /*: InkWell(
                                                            onTap: () {
                                                              BlocProvider.of<FilterBloc>(context)..add(
                                                                  SelectParamEvent(select: SelectEntity(category: '',tags: e.key,theme: '',type: ''), paramEntity: state.param));
                                                            },
                                                            child: unCheckContainer()
                                                        ),*/
                                                              SizedBox(
                                                                  width: 10.w),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(SelectParamEvent(
                                                                  select: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags:
                                                                          e.key,
                                                                      theme: '',
                                                                      type: ''),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              unCheckContainer(),
                                                              SizedBox(
                                                                  width: 10.w),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        ),
                                                  SizedBox(height: 10.h),
                                                ],
                                              ))
                                          .toList()),
                                  Text(context.text.theme,
                                      style: AppTextStyles.clearSansS16cl82),
                                  SizedBox(height: 10.h),
                                  Column(
                                      children: param.theme.entries
                                          .map((e) => Column(
                                                children: [
                                                  filterTheme.contains(e.key)
                                                      ? InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(UnSelectParamEvent(
                                                                  unSelect: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags: '',
                                                                      theme:
                                                                          e.key,
                                                                      type: ''),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              checkContainer(),
                                                              /* : InkWell(
                                                            onTap: () {
                                                              BlocProvider.of<FilterBloc>(context)..add(
                                                                  SelectParamEvent(select: SelectEntity(category: '',tags: '',theme: e.key,type: ''), paramEntity: state.param));
                                                              */ /*filterCat
                                                                      .add(e.key);*/ /*
                                                            },
                                                            child: unCheckContainer()
                                                        ),*/
                                                              SizedBox(
                                                                  width: 10.w),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                    FilterBloc>(
                                                                context)
                                                              .add(SelectParamEvent(
                                                                  select: SelectEntity(
                                                                      category:
                                                                          '',
                                                                      tags: '',
                                                                      theme:
                                                                          e.key,
                                                                      type: ''),
                                                                  paramEntity:
                                                                      state
                                                                          .param));
                                                          },
                                                          child: Row(
                                                            children: [
                                                              unCheckContainer(),
                                                              SizedBox(
                                                                  width: 10.w),
                                                              Text(e.value,
                                                                  style: AppTextStyles
                                                                      .clearSansS14CBlackF400),
                                                            ],
                                                          ),
                                                        ),
                                                  SizedBox(height: 10.h),
                                                ],
                                              ))
                                          .toList()),
                                  SizedBox(height: 32.h),
                                  InkWell(
                                    child: button(
                                        text: context.text.button_filter),
                                    onTap: () {
                                      print('$filterTags filter tag');
                                      Navigator.pop(context);
                                      BlocProvider.of<LibraryBloc>(context).add(
                                          GetLibraryEvent(
                                              filterList: FilterList(
                                                  filterTags:
                                                      filterTags.toList(),
                                                  filterCat: filterCat.toList(),
                                                  filterTheme:
                                                      filterTheme.toList(),
                                                  filterType:
                                                      filterType.toList(),
                                                  search: search)));
                                    },
                                  )
                                ],
                              );
                            }
                            if (state is ErrorFilterState) {
                              return errorWidget(context);
                            }
                            return Container();
                          },
                        );
                      }),
                    ),
                  ));
            },
          );
        },
        child:
            Image.asset('assets/icon/filter.png', width: 24.w, height: 24.h)),
  );
}
