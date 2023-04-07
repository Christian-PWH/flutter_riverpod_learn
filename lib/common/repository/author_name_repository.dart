import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_name_repository.g.dart';

@Riverpod(keepAlive: true)
AuthorNameRepository authorNameRepository(AuthorNameRepositoryRef ref) {
  return AuthorNameRepository();
}

class AuthorNameRepository {
  List<String> dummyAuthorData = [
    "MyNameHere",
    "Claudia Wilson",
    "Matt Zhang",
  ];

  Future<List<String>> getAuthor() async {
    return Future.delayed(const Duration(seconds: 2), () => dummyAuthorData);
  }
}
