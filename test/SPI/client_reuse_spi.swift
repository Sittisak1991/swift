/// A module should be able to leak SPI types from an import through SPI decls

// RUN: %empty-directory(%t)
// RUN: split-file %s %t
// RUN: %target-swift-frontend -emit-module %t/A.swift -module-name A -emit-module-path %t/A.swiftmodule
// RUN: %target-swift-frontend -emit-module %t/B.swift -module-name B -emit-module-path %t/B.swiftmodule -I %t
// RUN: %target-swift-frontend -typecheck -verify -verify-ignore-unknown %t/C.swift -I %t

//--- A.swift
@_spi(A) public struct SecretStruct {
  @_spi(A) public func bar() {}
}

//--- B.swift

@_spi(A) import A

@_spi(B) public func foo() -> SecretStruct { fatalError() }

//--- C.swift

@_spi(B) import B
// expected-note{{add import of module 'A'}}{{1-1=@_spi(A) import A\n}}
var a = foo() // OK
a.bar() // expected-error{{instance method 'bar()' is not available due to missing import of defining module 'A'}}

var b = SecretStruct() // expected-error{{cannot find 'SecretStruct' in scope}}
