import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learn/author/repository/author_repository.dart';
import 'package:flutter_riverpod_learn/common/controller/author_name_controller.dart';
import 'package:flutter_riverpod_learn/common/models/book_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_controller.g.dart';

final genreSelectedItemProvider = StateProvider((ref) => 'All');

final futureFilteredList = FutureProvider<List<BookModel>>((ref) {
  final filteredBooks = ref.watch(filteredListBook);
  return Future.value(filteredBooks);
});

final searchTextProvider = StateProvider((ref) => '');

final filteredListBook = StateProvider<List<BookModel>>((ref) {
  final books = ref.watch(authorControllerProvider);
  final searchText = ref.watch(searchTextProvider);
  final genreSelectedItem = ref.watch(genreSelectedItemProvider);
  final authorSelectedItem = ref.watch(authorSelectedItemProvider);

  if (genreSelectedItem == "All") {
    debugPrint("authorController default by genre : $books");
    return books;
  }

  if (genreSelectedItem != "All") {
    debugPrint(
        "return ${books.where((bookModel) => bookModel.genre.contains(genreSelectedItem)).toList()}");

    return books
        .where((bookModel) => bookModel.genre.contains(genreSelectedItem))
        .toList();
  }

  if (authorSelectedItem == "All") {
    debugPrint("authorController default by genre : $books");
    return books;
  }

  if (authorSelectedItem != "All") {
    debugPrint(
        "return ${books.where((bookModel) => bookModel.author.toLowerCase().contains(authorSelectedItem)).toList()}");

    return books
        .where((bookModel) =>
            bookModel.author.toLowerCase().contains(authorSelectedItem))
        .toList();
  }

  if (searchText.isEmpty) {
    debugPrint("authorController default : $books");
    return books;
  }

  debugPrint("authorController : $books");

  debugPrint(
      "return ${books.where((bookModel) => bookModel.title.toLowerCase().contains(searchText)).toList()}");

  return books
      .where((bookModel) => bookModel.title.toLowerCase().contains(searchText))
      .toList();
});

@Riverpod(keepAlive: true)
class AuthorController extends _$AuthorController {
  late final AuthorRepository authorRepository;

  @override
  List<BookModel> build() {
    authorRepository = ref.watch(authorRepositoryProvider);
    return [];
  }

  Future<List<BookModel>> getBooks() async {
    final response = await authorRepository.getBooks();
    if (response.isEmpty) {
      return [];
    }
    final List<BookModel> books =
        response.map((e) => BookModel.fromMap(e)).toList();
    state = books;
    return books;
  }
}
