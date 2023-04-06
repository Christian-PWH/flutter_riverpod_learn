// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredListHash() => r'69718d402cc0338183613e1647e827004ec584a9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FilteredListRef = FutureProviderRef<List<BookModel>>;

/// See also [filteredList].
@ProviderFor(filteredList)
const filteredListProvider = FilteredListFamily();

/// See also [filteredList].
class FilteredListFamily extends Family<AsyncValue<List<BookModel>>> {
  /// See also [filteredList].
  const FilteredListFamily();

  /// See also [filteredList].
  FilteredListProvider call({
    String searchText = '',
  }) {
    return FilteredListProvider(
      searchText: searchText,
    );
  }

  @override
  FilteredListProvider getProviderOverride(
    covariant FilteredListProvider provider,
  ) {
    return call(
      searchText: provider.searchText,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredListProvider';
}

/// See also [filteredList].
class FilteredListProvider extends FutureProvider<List<BookModel>> {
  /// See also [filteredList].
  FilteredListProvider({
    this.searchText = '',
  }) : super.internal(
          (ref) => filteredList(
            ref,
            searchText: searchText,
          ),
          from: filteredListProvider,
          name: r'filteredListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredListHash,
          dependencies: FilteredListFamily._dependencies,
          allTransitiveDependencies:
              FilteredListFamily._allTransitiveDependencies,
        );

  final String searchText;

  @override
  bool operator ==(Object other) {
    return other is FilteredListProvider && other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$authorControllerHash() => r'3b3e4e7b882bc061db7366011210c2c3ca8cb41f';

/// See also [AuthorController].
@ProviderFor(AuthorController)
final authorControllerProvider =
    NotifierProvider<AuthorController, List<BookModel>>.internal(
  AuthorController.new,
  name: r'authorControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authorControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthorController = Notifier<List<BookModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
