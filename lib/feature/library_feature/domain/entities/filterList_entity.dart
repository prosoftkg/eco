import 'package:equatable/equatable.dart';

class FilterList extends Equatable{
  final List<String> filterTags;
  final List<String> filterCat;
  final List<String> filterType;
  final List<String> filterTheme;
  String? search;

  FilterList({required this.filterTags, required this.filterCat, required this.filterType, required this.filterTheme,required this.search});

  @override
  List<Object?> get props => [filterTags, filterCat, filterType, filterTheme,search];
}