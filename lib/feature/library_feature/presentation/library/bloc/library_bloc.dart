import 'package:bloc/bloc.dart';
import 'package:eco_kg/core/use_case/use_case.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/filterList_entity.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:eco_kg/feature/library_feature/domain/use_case/removeHistory.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_case/historyUseCase.dart';
import '../../../domain/use_case/libraryIUseCase.dart';
part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryUseCase libraryUseCase;
  final HistoryUseCase historyUseCase;
  final RemoveHistoryUseCase removeUseCase;
  LibraryBloc({required this.libraryUseCase,required this.historyUseCase,required this.removeUseCase}) : super(LibraryInitial()) {
    on<GetLibraryEvent>(_getLibrary);
    on<DetailLibaryEvent>(_detailLibrary);
    on<SearchLibraryEvent>(_searchLibrary);
    on<RemoveHistoryLibraryEvent>(_removeHistoryLibrary);
  }
  _getLibrary(GetLibraryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    final either=await libraryUseCase.call(event.filterList);
    either.fold((error) => emit(ErrorLibraryState(error: error)), (library){
      print('len of products ${library.dataProvider.length}');
      emit(LoadedLibraryState(library: library,filterList: event.filterList));
    });
  }

  _searchLibrary(SearchLibraryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    final either=await historyUseCase.call(NoParams());
    either.fold((error) => emit(ErrorLibraryState(error: error)), (history){
      print('history $history');

      emit(LoadedSearchLibraryState(historySearch: history,filterList: event.filterList));
    });
  }

  _removeHistoryLibrary(RemoveHistoryLibraryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    final either=await removeUseCase.call(event.remove);
    either.fold((error) => emit(ErrorLibraryState(error: error)), (history){

      emit(LoadedRemoveHistoryState());
    });
  }

  _detailLibrary(DetailLibaryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    emit(LoadedDetailLibraryState(detailLibrary: event.detailLibrary));
  }
}
