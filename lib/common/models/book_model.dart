import 'package:flutter/foundation.dart';

@immutable
class BookModel {
  final String id;
  final String imagePath;
  final String title;
  final List<String> genre;
  final String author;
  final DateTime createdAt;
  final String bookDesc;

  const BookModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.genre,
    required this.author,
    required this.createdAt,
    required this.bookDesc,
  });

  BookModel copyWith({
    String? id,
    String? imagePath,
    String? title,
    List<String>? genre,
    String? author,
    DateTime? createdAt,
    String? bookDesc,
  }) {
    return BookModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      bookDesc: bookDesc ?? this.bookDesc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
      'title': title,
      'genre': genre,
      'author': author,
      'createdAt': createdAt,
      'bookDesc': bookDesc,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
      genre: map['genre'] as List<String>,
      author: map['author'] as String,
      createdAt: map['createdAt'] as DateTime,
      bookDesc: map['bookDesc'] as String,
    );
  }
}
