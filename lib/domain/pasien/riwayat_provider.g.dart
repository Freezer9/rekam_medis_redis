// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPasienRecordHash() => r'e0e8cb122afeda14e1a04786e78877f2b1b54318';

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

/// See also [getPasienRecord].
@ProviderFor(getPasienRecord)
const getPasienRecordProvider = GetPasienRecordFamily();

/// See also [getPasienRecord].
class GetPasienRecordFamily extends Family<AsyncValue<List<RecordModel>>> {
  /// See also [getPasienRecord].
  const GetPasienRecordFamily();

  /// See also [getPasienRecord].
  GetPasienRecordProvider call(
    String id,
  ) {
    return GetPasienRecordProvider(
      id,
    );
  }

  @override
  GetPasienRecordProvider getProviderOverride(
    covariant GetPasienRecordProvider provider,
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
  String? get name => r'getPasienRecordProvider';
}

/// See also [getPasienRecord].
class GetPasienRecordProvider
    extends AutoDisposeFutureProvider<List<RecordModel>> {
  /// See also [getPasienRecord].
  GetPasienRecordProvider(
    String id,
  ) : this._internal(
          (ref) => getPasienRecord(
            ref as GetPasienRecordRef,
            id,
          ),
          from: getPasienRecordProvider,
          name: r'getPasienRecordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPasienRecordHash,
          dependencies: GetPasienRecordFamily._dependencies,
          allTransitiveDependencies:
              GetPasienRecordFamily._allTransitiveDependencies,
          id: id,
        );

  GetPasienRecordProvider._internal(
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
    FutureOr<List<RecordModel>> Function(GetPasienRecordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPasienRecordProvider._internal(
        (ref) => create(ref as GetPasienRecordRef),
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
    return _GetPasienRecordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPasienRecordProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPasienRecordRef on AutoDisposeFutureProviderRef<List<RecordModel>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetPasienRecordProviderElement
    extends AutoDisposeFutureProviderElement<List<RecordModel>>
    with GetPasienRecordRef {
  _GetPasienRecordProviderElement(super.provider);

  @override
  String get id => (origin as GetPasienRecordProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
