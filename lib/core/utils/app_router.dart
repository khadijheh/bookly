import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view%20model/similar_book/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/serach/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = "/homeView";
  static const kBokDetailsView = "/bookDetailsView";
  static const kSearchView = "/searchView";

  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(path: khomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),

      GoRoute(
        path: kBokDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child:  BookDetailsView( bookModel:  state.extra as BookModel),
        ),
      ),
    ],
  );
}
