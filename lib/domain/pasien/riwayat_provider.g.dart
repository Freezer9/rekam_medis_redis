// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPasienRecordHash() => r'629db20e6c381eb52e6bb4d04e3001cf79bac731';

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
class GetPasienRecordFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [getPasienRecord].
  const GetPasienRecordFamily();

  /// See also [getPasienRecord].
  GetPasienRecordProvider call({
    String? id,
    DateTime? date,
  }) {
    return GetPasienRecordProvider(
      id: id,
      date: date,
    );
  }

  @override
  GetPasienRecordProvider getProviderOverride(
    covariant GetPasienRecordProvider provider,
  ) {
    return call(
      id: provider.id,
      date: provider.date,
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
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// See also [getPasienRecord].
  GetPasienRecordProvider({
    String? id,
    DateTime? date,
  }) : this._internal(
          (ref) => getPasienRecord(
            ref as GetPasienRecordRef,
            id: id,
            date: date,
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
          date: date,
        );

  GetPasienRecordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.date,
  }) : super.internal();

  final String? id;
  final DateTime? date;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(GetPasienRecordRef provider)
        create,
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
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _GetPasienRecordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPasienRecordProvider &&
        other.id == id &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPasienRecordRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `date` of this provider.
  DateTime? get date;
}

class _GetPasienRecordProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with GetPasienRecordRef {
  _GetPasienRecordProviderElement(super.provider);

  @override
  String? get id => (origin as GetPasienRecordProvider).id;
  @override
  DateTime? get date => (origin as GetPasienRecordProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
