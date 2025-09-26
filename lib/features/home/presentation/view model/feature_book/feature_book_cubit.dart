import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:bookly/features/home/presentation/view%20model/feature_book/feature_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  final HomeRepo homeRepo;
  FeatureBookCubit(this.homeRepo) : super(FeatureBooksInitial());

  Future<void> fetchFeaturesBooks() async {
    emit(FeatureBooksLoading());
    var result = await homeRepo.fetchFeaturesBooks();
    result.fold((failure) {
      emit (FeatureBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
 