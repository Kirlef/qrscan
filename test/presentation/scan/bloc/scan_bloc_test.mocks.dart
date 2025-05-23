// Mocks generated by Mockito 5.4.4 from annotations
// in qrscan/test/presentation/scan/bloc/scan_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:qrscan/domain/entities/scan_entity.dart' as _i5;
import 'package:qrscan/domain/repositories/scan_repository.dart' as _i2;
import 'package:qrscan/domain/usecases/add_scan.dart' as _i3;
import 'package:qrscan/domain/usecases/delete_scan.dart' as _i7;
import 'package:qrscan/domain/usecases/get_scan.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeScanRepository_0 extends _i1.SmartFake
    implements _i2.ScanRepository {
  _FakeScanRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddScan].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddScan extends _i1.Mock implements _i3.AddScan {
  MockAddScan() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ScanRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeScanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ScanRepository);

  @override
  _i4.Future<void> call(_i5.ScanEntity? scan) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [scan],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [GetScans].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetScans extends _i1.Mock implements _i6.GetScans {
  MockGetScans() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ScanRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeScanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ScanRepository);

  @override
  _i4.Future<List<_i5.ScanEntity>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ScanEntity>>.value(<_i5.ScanEntity>[]),
      ) as _i4.Future<List<_i5.ScanEntity>>);
}

/// A class which mocks [DeleteScan].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteScan extends _i1.Mock implements _i7.DeleteScan {
  MockDeleteScan() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ScanRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeScanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ScanRepository);

  @override
  _i4.Future<void> call(int? id) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
