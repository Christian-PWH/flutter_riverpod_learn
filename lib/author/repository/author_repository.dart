import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_repository.g.dart';

@Riverpod(keepAlive: true)
AuthorRepository authorRepository(AuthorRepositoryRef ref) {
  return AuthorRepository();
}

class AuthorRepository {
  List<Map<String, dynamic>> dummyData = [
    {
      "id": "0",
      "imagePath": "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
      "title": "My Book Cover",
      "genre": ["Template", "Biography"],
      "author": "MyNameHere",
      "createdAt": DateTime(2020, 5, 13),
      "bookDesc": "Secrets in a silicon valley startup",
    },
    {
      "id": "1",
      "imagePath":
          "https://marketplace.canva.com/EAFFEs6P168/1/0/1003w/canva-orange-green-watercolor-soft-cute-cartoon-love-romance-book-cover-5Zk2VM0-EAc.jpg",
      "title": "Our Last Summer",
      "genre": ["Romance", "Slice of Life"],
      "author": "Claudia Wilson",
      "createdAt": DateTime(2020, 7, 17),
      "bookDesc": "Story of youthful romance",
    },
    {
      "id": "2",
      "imagePath":
          "https://marketplace.canva.com/EAD7YHrjZYY/1/0/1003w/canva-blue-illustrated-stars-children%27s-book-cover-haFtaSNXXF4.jpg",
      "title": "Journey to The Stars",
      "genre": ["Children Book", "Adventure", "casual"],
      "author": "Matt Zhang",
      "createdAt": DateTime(2020, 1, 23),
      "bookDesc": "A bedtime story for kids",
    }
  ];

  AuthorRepository();

  Future<List<Map<String, dynamic>>> get() async {
    return Future.delayed(const Duration(seconds: 2), () => dummyData);
  }
}
