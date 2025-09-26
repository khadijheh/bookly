import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBookState extends Equatable {
  const NewestBookState();
  @override
  List<Object?> get props => [];
}

class NewestBookInitial extends NewestBookState {}

class NewestBookLoading extends NewestBookState {}

class NewestBookFailure extends NewestBookState {
  final String errMessage;

  const NewestBookFailure(this.errMessage);
}

class NewestBookSuccess extends NewestBookState {
  final List<BookModel> books;

  const NewestBookSuccess(this.books);
}
