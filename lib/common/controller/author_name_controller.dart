import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learn/common/repository/author_name_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_name_controller.g.dart';

final authorSelectedItemProvider = StateProvider((ref) => 'All');

@Riverpod(keepAlive: true)
class AuthorNameController extends _$AuthorNameController {
  late final AuthorNameRepository authorNameRepository;

  @override
  List<String> build() {
    authorNameRepository = ref.watch(authorNameRepositoryProvider);
    return [];
  }

  Future<List<String>> getAuthors() async {
    final response = await authorNameRepository.getAuthor();
    if (response.isEmpty) {
      return [];
    }
    List<String> tmpList = ["All"];
    tmpList.addAll(response);
    state = tmpList;
    return tmpList;
  }
}
