// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_pasien_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHistoryPasienHash() => r'e30c93a2c443011e8c83a01e8bfdf91504686681';

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

/// See also [getHistoryPasien].
@ProviderFor(getHistoryPasien)
const getHistoryPasienProvider = GetHistoryPasienFamily();

/// See also [getHistoryPasien].
class GetHistoryPasienFamily extends Family<AsyncValue<List<RecordModel>>> {
  /// See also [getHistoryPasien].
  const GetHistoryPasienFamily();

  /// See also [getHistoryPasien].
  GetHistoryPasienProvider call(
    String id,
  ) {
    return GetHistoryPasienProvider(
      id,
    );
  }

  @override
  GetHistoryPasienProvider getProviderOverride(
    covariant GetHistoryPasienProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getHistoryPasienProvider';
}

/// See also [getHistoryPasien].
class GetHistoryPasienProvider
    extends AutoDisposeFutureProvider<List<RecordModel>> {
  /// See also [getHistoryPasien].
  GetHistoryPasienProvider(
    String id,
  ) : this._internal(
          (ref) => getHistoryPasien(
            ref as GetHistoryPasienRef,
            id,
          ),
          from: getHistoryPasienProvider,
          name: r'getHistoryPasienProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHistoryPasienHash,
          dependencies: GetHistoryPasienFamily._dependencies,
          allTransitiveDependencies:
              GetHistoryPasienFamily._allTransitiveDependencies,
          id: id,
        );

  GetHistoryPasienProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<RecordModel>> Function(GetHistoryPasienRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHistoryPasienProvider._internal(
        (ref) => create(ref as GetHistoryPasienRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RecordModel>> createElement() {
    return _GetHistoryPasienProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHistoryPasienProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetHistoryPasienRef on AutoDisposeFutureProviderRef<List<RecordModel>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetHistoryPasienProviderElement
    extends AutoDisposeFutureProviderElement<List<RecordModel>>
    with GetHistoryPasienRef {
  _GetHistoryPasienProviderElement(super.provider);

  @override
  String get id => (origin as GetHistoryPasienProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
