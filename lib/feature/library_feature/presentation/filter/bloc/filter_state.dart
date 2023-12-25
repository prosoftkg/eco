part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();
}

class FilterInitial extends FilterState {
  @override
  List<Object> get props => [];
}

class LoadingFilterState extends FilterState{
  @override
  List<Object> get props=>[];
}

class LoadedFilterState extends FilterState{
  SelectEntity selectFilters;
  SelectEntity removeFilters;
  final ParamEntity param;
  LoadedFilterState({required this.param,required this.selectFilters,required this.removeFilters});
  @override
  List<Object> get props=>[param,selectFilters,removeFilters];
}

class ErrorFilterState extends FilterState{
  final Object error;
  const ErrorFilterState({required this.error});
  @override
  List<Object> get props=>[error];
}

