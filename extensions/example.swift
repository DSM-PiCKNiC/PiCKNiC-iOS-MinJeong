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
        "**\(self)**"
    }
    
    var italics: String {
        "*\(self)*"
    }
    
    func heading(of level: Int) -> String {
        "\("#".repeated(level)) \(self)"
    }
}

print("Hello \("World".bold)".heading(of: 2)) // ## Hello **World**

class Foo: Equatable {
    
    let foo: Int
    
    init(foo: Int) {
        self.foo = foo
    }
    
    static func == (lhs: Foo, rhs: Foo) -> Bool {
        lhs.foo == rhs.foo
    }
    
}

let foo1 = Foo(foo: 1)
let foo2 = Foo(foo: 1)

print(foo1 == foo2) // true
print(foo1 != foo2) // false
