import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:bookly/features/home/presentation/view%20model/Newest_book/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit  extends Cubit<NewestBookState> {
  final HomeRepo homeRepo;
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit (NewestBookFailure(failure.errMessage));
    }, (books) {
      emit(NewestBookSuccess(books));
    });
  }
}
 