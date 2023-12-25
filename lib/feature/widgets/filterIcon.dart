import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/select_entity.dart';
import 'package:flutter/material.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/app_colors.dart';
import '../../core/style/app_text_styles.dart';
import '../library_feature/domain/entities/param_entity.dart';
import '../library_feature/presentation/filter/bloc/filter_bloc.dart';
import '../library_feature/presentation/filter/filter.dart';
import '../splash_feature/presentation/bloc/language_bloc.dart';
import 'defaultTextStyle.dart';

Widget filter(BuildContext context) {
  List<String> filterCat = [];
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: InkWell(
        onTap: () {
          /*Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const FilterScreen()));*/
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, stateLan) {
                        return BlocBuilder<FilterBloc, FilterState>(
                          bloc: BlocProvider.of<FilterBloc>(context)..add(
                          GetParamEvent(lanCode: stateLan.lanCode)),
                          builder: (context, state) {
                            if (state is LoadingFilterState) {
                              return Center(child: progressWidget());
                            }
                            if (state is LoadedFilterState) {
                              final ParamEntity param = state.param;
                              filterCat.add(state.selectFilters.category);
                              filterCat
                                  .remove(state.removeFilters.category);
                              return ListView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 22),
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Text(context.text.filter,
                                          style: AppTextStyles
                                              .clearSansMediumTextStyle16),
                                      InkWell(
                                        onTap: (){
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
                                  const SizedBox(height: 10),
                                  Column(
                                      children: param.type.entries
                                          .map((e) => Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      filterCat.contains(e.key)
                                                          ? InkWell(
                                                              onTap: () {
                                                                BlocProvider.of<FilterBloc>(context)..add(
                                                                    UnSelectParamEvent(unSelect: SelectEntity(category: e.key,tags: '',theme: '',type: ''), paramEntity: state.param));
                                                              },
                                                              child: Container(
                                                                width: 20.w,
                                                                height: 20.h,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors
                                                                        .colorEAFEF1,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                6),
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color: AppColors
                                                                            .color009D9B)),
                                                                child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/icon/check.png',
                                                                    width: 14,
                                                                    height: 14,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                BlocProvider.of<FilterBloc>(context)..add(
                                                                    SelectParamEvent(select: SelectEntity(category: e.key,tags: '',theme: '',type: ''), paramEntity: state.param));
                                                                /*filterCat
                                                                    .add(e.key);*/
                                                              },
                                                              child: Container(
                                                                width: 20.w,
                                                                height: 20.h,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                6),
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color: AppColors
                                                                            .color828282)),
                                                              ),
                                                            ),
                                                      const SizedBox(width: 10),
                                                      Text(e.value,
                                                          style: AppTextStyles
                                                              .clearSansS14CBlackF400),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ))
                                          .toList()),
                                  const SizedBox(height: 22),
                                  Text(context.text.category,
                                      style: AppTextStyles.clearSansS16cl82),
                                  const SizedBox(height: 10),
                                  Wrap(
                                      spacing: 8,
                                      runSpacing: 5,
                                      children: param.category.entries
                                          .map((e) => SizedBox(
                                                width: 83.w,
                                                child: Container(
                                                  height: 20.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                                10)
                                                            .r,
                                                    color:
                                                        AppColors.color009D9B,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      e.value,
                                                      style: AppTextStyles
                                                          .clearSansMediumS12W500CWhite,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                          .toList()),
                                  const SizedBox(height: 22),
                                  Text(context.text.tags,
                                      style: AppTextStyles.clearSansS16cl82),
                                  const SizedBox(height: 10),
                                  Column(
                                      children: param.tags.entries
                                          .map((e) => Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColors
                                                                    .color828282)),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(e.value,
                                                          style: AppTextStyles
                                                              .clearSansS14CBlackF400),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ))
                                          .toList()),
                                  Text(context.text.theme,
                                      style: AppTextStyles.clearSansS16cl82),
                                  const SizedBox(height: 10),
                                  Column(
                                      children: param.theme.entries
                                          .map((e) => Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColors
                                                                    .color828282)),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(e.value,
                                                          style: AppTextStyles
                                                              .clearSansS14CBlackF400),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ))
                                          .toList()),
                                ],
                              );
                            }
                            if (state is ErrorFilterState) {
                              print(state.error);
                              return Center(
                                  child: Text(state.error.toString()));
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
        child: Image.asset('assets/icon/filter.png', width: 24, height: 24)),
  );
}
