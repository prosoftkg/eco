import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class RemoveHistoryUseCase extends UseCase<void,String>{
  final LibraryRepository libraryRepository;
  RemoveHistoryUseCase({required this.libraryRepository});

  @override
  Future<Either<Failure, void>> call(String removeHistory) async{
    return await libraryRepository.removeHistorySearch(removeHistory);
  }
}