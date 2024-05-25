// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasien_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllPasienHash() => r'e4ba5a14f74cadc74e53a9375a09ba84df1fc8d0';

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

/// See also [getAllPasien].
@ProviderFor(getAllPasien)
const getAllPasienProvider = GetAllPasienFamily();

/// See also [getAllPasien].
class GetAllPasienFamily extends Family<AsyncValue<List<PasienModel>>> {
  /// See also [getAllPasien].
  const GetAllPasienFamily();

  /// See also [getAllPasien].
  GetAllPasienProvider call(
    String id,
  ) {
    return GetAllPasienProvider(
      id,
    );
  }

  @override
  GetAllPasienProvider getProviderOverride(
    covariant GetAllPasienProvider provider,
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
  String? get name => r'getAllPasienProvider';
}

/// See also [getAllPasien].
class GetAllPasienProvider
    extends AutoDisposeFutureProvider<List<PasienModel>> {
  /// See also [getAllPasien].
  GetAllPasienProvider(
    String id,
  ) : this._internal(
          (ref) => getAllPasien(
            ref as GetAllPasienRef,
            id,
          ),
          from: getAllPasienProvider,
          name: r'getAllPasienProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllPasienHash,
          dependencies: GetAllPasienFamily._dependencies,
          allTransitiveDependencies:
              GetAllPasienFamily._allTransitiveDependencies,
          id: id,
        );

  GetAllPasienProvider._internal(
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
    FutureOr<List<PasienModel>> Function(GetAllPasienRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllPasienProvider._internal(
        (ref) => create(ref as GetAllPasienRef),
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
  AutoDisposeFutureProviderElement<List<PasienModel>> createElement() {
    return _GetAllPasienProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllPasienProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllPasienRef on AutoDisposeFutureProviderRef<List<PasienModel>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetAllPasienProviderElement
    extends AutoDisposeFutureProviderElement<List<PasienModel>>
    with GetAllPasienRef {
  _GetAllPasienProviderElement(super.provider);

  @override
  String get id => (origin as GetAllPasienProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
