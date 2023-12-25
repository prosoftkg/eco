part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class GetParamEvent extends FilterEvent{
  SelectEntity selectEntity=SelectEntity(type: '', category: '', tags: '', theme: '');
  final String lanCode;
  GetParamEvent({required this.lanCode});
  @override
  List<Object> get props=>[lanCode,selectEntity];
}

class SelectParamEvent extends FilterEvent {
  final ParamEntity paramEntity;
  final SelectEntity select;
  const SelectParamEvent({
    required this.select,
    required this.paramEntity
  });

  @override
  List<Object?> get props => [select,paramEntity];
}

class UnSelectParamEvent extends FilterEvent {
  final ParamEntity paramEntity;
  final SelectEntity unSelect;
  const UnSelectParamEvent({
    required this.unSelect,
    required this.paramEntity
  });

  @override
  List<Object?> get props => [unSelect,paramEntity];
}