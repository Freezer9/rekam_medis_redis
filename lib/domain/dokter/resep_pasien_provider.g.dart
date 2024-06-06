// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resep_pasien_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getResepPasienHash() => r'cbe1b017dcf245f715baed031da9ac3c7317093a';

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

/// See also [getResepPasien].
@ProviderFor(getResepPasien)
const getResepPasienProvider = GetResepPasienFamily();

/// See also [getResepPasien].
class GetResepPasienFamily extends Family<AsyncValue<List<ObatModel>>> {
  /// See also [getResepPasien].
  const GetResepPasienFamily();

  /// See also [getResepPasien].
  GetResepPasienProvider call(
    String id,
  ) {
    return GetResepPasienProvider(
      id,
    );
  }

  @override
  GetResepPasienProvider getProviderOverride(
    covariant GetResepPasienProvider provider,
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
  String? get name => r'getResepPasienProvider';
}

/// See also [getResepPasien].
class GetResepPasienProvider
    extends AutoDisposeFutureProvider<List<ObatModel>> {
  /// See also [getResepPasien].
  GetResepPasienProvider(
    String id,
  ) : this._internal(
          (ref) => getResepPasien(
            ref as GetResepPasienRef,
            id,
          ),
          from: getResepPasienProvider,
          name: r'getResepPasienProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getResepPasienHash,
          dependencies: GetResepPasienFamily._dependencies,
          allTransitiveDependencies:
              GetResepPasienFamily._allTransitiveDependencies,
          id: id,
        );

  GetResepPasienProvider._internal(
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
    FutureOr<List<ObatModel>> Function(GetResepPasienRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetResepPasienProvider._internal(
        (ref) => create(ref as GetResepPasienRef),
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
  AutoDisposeFutureProviderElement<List<ObatModel>> createElement() {
    return _GetResepPasienProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetResepPasienProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetResepPasienRef on AutoDisposeFutureProviderRef<List<ObatModel>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetResepPasienProviderElement
    extends AutoDisposeFutureProviderElement<List<ObatModel>>
    with GetResepPasienRef {
  _GetResepPasienProviderElement(super.provider);

  @override
  String get id => (origin as GetResepPasienProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
