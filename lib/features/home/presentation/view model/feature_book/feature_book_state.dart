import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBookState extends Equatable {
  const FeatureBookState();
  @override
  List<Object> get props => [];
}

class FeatureBooksInitial extends FeatureBookState {}

class FeatureBooksLoading extends FeatureBookState {}

class FeatureBooksFailure extends FeatureBookState {
  final String errormessage;

  const FeatureBooksFailure(this.errormessage);
}

class FeatureBooksSuccess extends FeatureBookState {
  final List<BookModel> books;

  const FeatureBooksSuccess(this.books);
}
