// Mocks generated by Mockito 5.4.4 from annotations
// in qrscan/test/domain/repositories/biometric_auth_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:qrscan/core/entities/app_biometric_type.dart' as _i4;
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart'
    as _i2;

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

/// A class which mocks [BiometricAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBiometricAuthRepository extends _i1.Mock
    implements _i2.BiometricAuthRepository {
  MockBiometricAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.AppBiometricType> getBiometricType() => (super.noSuchMethod(
        Invocation.method(
          #getBiometricType,
          [],
        ),
        returnValue:
            _i3.Future<_i4.AppBiometricType>.value(_i4.AppBiometricType.none),
      ) as _i3.Future<_i4.AppBiometricType>);

  @override
  _i3.Future<bool> authenticate() => (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
