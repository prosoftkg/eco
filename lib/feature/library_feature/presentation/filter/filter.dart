import 'package:eco_kg/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../../domain/entities/param_entity.dart';
import 'bloc/filter_bloc.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(context) {
    final paramBloc = context.read<FilterBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: BlocBuilder<LanguageBloc, LanguageState>(builder: (context,stateLan){
              return BlocBuilder<FilterBloc, FilterState>(
                bloc: paramBloc..add(GetParamEvent(lanCode: stateLan.lanCode)),
                builder: (context, state) {
                  if (state is LoadingFilterState) {
                    return Center(child: progressWidget());
                  }
                  if (state is LoadedFilterState) {
                    final ParamEntity param = state.param;
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Card(child: Text('Фильтр',style: AppTextStyles.clearSansMediumTextStyle16)),
                            Image.asset('assets/icon/close-square.png',width: 20.w,height: 20.h,),
                          ],
                        ),
                        SizedBox(height: 22.h),
                        Text(context.text.type,style: AppTextStyles.clearSansS16cl82),
                        SizedBox(height: 10),
                        Column(
                            children:
                            param.type.entries.map((e) =>
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:20.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(width: 1,color: AppColors.color828282)
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(e.value,style: AppTextStyles.clearSansS14CBlackF400),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )).toList()
                        ),
                        SizedBox(height: 22),
                        Text(context.text.category,style: AppTextStyles.clearSansS16cl82),
                        SizedBox(height: 10),
                        Wrap(
                            spacing: 8,
                            runSpacing: 5,
                          children:
                            param.category.entries.map((e) => SizedBox(
                              width: 83.w,
                              child: Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10).r,
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
                            )).toList()
                        ),
                        Text(context.text.tags,style: AppTextStyles.clearSansS16cl82),
                        SizedBox(height: 10),
                        Column(
                            children:
                            param.tags.entries.map((e) => Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(width: 1,color: AppColors.color828282)
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(e.value,style: AppTextStyles.clearSansS14CBlackF400),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            )).toList()
                        ),
                        Text(context.text.theme,style: AppTextStyles.clearSansS16cl82),
                        SizedBox(height: 10),
                        Column(
                            children:
                            param.theme.entries.map((e) => Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(width: 1,color: AppColors.color828282)
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(e.value,style: AppTextStyles.clearSansS14CBlackF400),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            )).toList()
                        ),
                      ],
                    );
                  }
                  if(state is ErrorFilterState){
                    print(state.error);
                    return Center(child: Text(state.error.toString()));
                  }
                  return Container();
                },
              );
            }),
        ),
      ),
    );
  }

}
