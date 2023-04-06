import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learn/author/repository/author_repository.dart';
import 'package:flutter_riverpod_learn/common/models/book_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<BookModel>> filteredList(FilteredListRef ref,
    {String searchText = ''}) {
  final books = ref.watch(authorControllerProvider);

  if (searchText.isEmpty) {
    debugPrint("authorController default : $books");
    return Future.value(books);
  }

  debugPrint("authorController : $books");

  debugPrint(
      "return ${books.where((bookModel) => bookModel.title.toLowerCase().contains(searchText)).toList()}");

  return Future.value(books
      .where((bookModel) => bookModel.title.toLowerCase().contains(searchText))
      .toList());
}

@Riverpod(keepAlive: true)
class AuthorController extends _$AuthorController {
  late final AuthorRepository authorRepository;

  @override
  List<BookModel> build() {
    authorRepository = ref.watch(authorRepositoryProvider);
    return [];
  }

  Future<List<BookModel>> getBooks() async {
    final response = await authorRepository.get();
    if (response.isEmpty) {
      return [];
    }
    final List<BookModel> books =
        response.map((e) => BookModel.fromMap(e)).toList();
    state = books;
    return books;
  }

  Future<List<BookModel>> filtered({String searchText = ''}) async {
    final books = ref.watch(authorControllerProvider);

    if (searchText.isEmpty) {
      debugPrint("authorController default : $books");
      return Future.value(books);
    }

    debugPrint("authorController : $books");

    debugPrint(
        "return ${books.where((bookModel) => bookModel.title.toLowerCase().contains(searchText)).toList()}");

    return Future.value(books
        .where(
            (bookModel) => bookModel.title.toLowerCase().contains(searchText))
        .toList());
  }
}
