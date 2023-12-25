part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();
}

class GetLibraryEvent extends LibraryEvent{
  final FilterList filterList;

  const GetLibraryEvent({required this.filterList});
  @override
  List<Object> get props=>[filterList];
}

class SearchLibraryEvent extends LibraryEvent{
  final FilterList filterList;

  const SearchLibraryEvent({required this.filterList});
  @override
  List<Object> get props=>[filterList];
}

class RemoveHistoryLibraryEvent extends LibraryEvent{
  final FilterList filterList;
  final String remove;
  const RemoveHistoryLibraryEvent({required this.remove,required this.filterList});
  @override
  List<Object> get props=>[remove,filterList];
}

class DetailLibaryEvent extends LibraryEvent{

  final DataProvider detailLibrary;

  const DetailLibaryEvent({required this.detailLibrary});

  @override
  List<Object> get props=>[detailLibrary];
}