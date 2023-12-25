part of 'library_bloc.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();
}

class LibraryInitial extends LibraryState {
  @override
  List<Object> get props => [];
}

class LoadingLibraryState extends LibraryState{
  @override
  List<Object> get props=>[];
}

class LoadedLibraryState extends LibraryState{
  final LibraryEntity library;
  final FilterList filterList;
  const LoadedLibraryState({required this.library,required this.filterList});
  @override
  List<Object> get props=>[library];
}

class LoadedRemoveHistoryState extends LibraryState{
  @override
  List<Object> get props=>[];
}

class LoadedSearchLibraryState extends LibraryState{
  final List<String> historySearch;
  final FilterList filterList;
  const LoadedSearchLibraryState({required this.historySearch,required this.filterList});
  @override
  List<Object> get props=>[historySearch];
}

class LoadedDetailLibraryState extends LibraryState{
  final DataProvider detailLibrary;
  const LoadedDetailLibraryState({required this.detailLibrary});
  @override
  List<Object> get props=>[detailLibrary];
}

class ErrorLibraryState extends LibraryState{
  final Object error;
  const ErrorLibraryState({required this.error});
  @override
  List<Object> get props=>[error];
}
