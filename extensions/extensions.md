## 확장 (Extension)

클래스 / 구조체 / 열거체 / 프로토콜에 추가 기능 달아주기

- 계산 프로퍼티 (stored 같이 메모리 구조를 변화시키는 것은 x)
- 메세드
- 생성자
- subscripts
- nested types
- 프로토콜 만족시키기

```swift
extension Foo {
	// 일반적인 선언과 같은 형식
}
```

<aside>
💡

쓰는 이유

- 원래 선언에 접근하지 않고도 기능을 추가할 수 있음
- 코드 분리
</aside>

## 내장 객체 확장

- `Int`, `String` 등의 내장 객체 등을 확장할 수 있다
- UIKit 등의 프레임워크 객체도 확장하여 편리하게 쓸 수 있게 함

예제

```swift
import Foundation

// Computed properties

extension Int {
    var squared: Int {
        return self * self
    }
}

let four = 2.squared
print(four) // 4

// Methods

extension String {
    mutating func emphasize() {
        self += "!!!"
    }
}

var hello = "Hello World"
hello.emphasize()
print(hello) // Hello World!!!

// Markdown example

extension String {
    func repeated(_ count: Int) -> String {
        Array(repeating: self, count: count).joined(separator: "")
    }

    var bold: String {
        "**\\(self)**"
    }

    var italics: String {
        "*\\(self)*"
    }

    func heading(of level: Int) -> String {
        "\\("#".repeated(level)) \\(self)"
    }
}

print("Hello \\("World".bold)".heading(of: 2)) // ## Hello **World**
```

## Protocols

### 프로토콜 준수하기

`extension SomeType: SomeProtocol, AnotherProtocol`

### 프로토콜 확장 (protocol extensions)

- 프로토콜을 준수하는 개체에게 추가 기능을 달아줌
- 프로토콜의 메서드/계산 프로퍼티에게 기본값을 줄 수 있음

Standard Library에서의 `Equatable` 프로토콜 확장 [#](https://github.com/swiftlang/swift/blob/main/stdlib/public/core/Equatable.swift#L179)

→ `==`만 구현해도 `!=`를 쓸 수 있게 함

```swift
extension Equatable {
  @_transparent
  public static func != (lhs: Self, rhs: Self) -> Bool {
    return !(lhs == rhs)
  }
}
```

```swift
class Foo: Equatable {
    let foo: Int

    init(foo: Int) {
        self.foo = foo
    }

    static func == (lhs: Foo, rhs: Foo) -> Bool { // == 연산자 구현
        lhs.foo == rhs.foo
    }
}

let foo1 = Foo(foo: 1)
let foo2 = Foo(foo: 1)

print(foo1 == foo2) // true
print(foo1 != foo2) // false (자동으로 제공됨)
```

## 참고자료

[공식문서](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
