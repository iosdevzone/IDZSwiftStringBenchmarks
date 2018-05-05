import Foundation

let unicharNewline = unichar(10)
let unicodeScalarNewline = Unicode.Scalar(10)
let utf8Newline = UInt8(10)
let characterNewline = Character("\n")

// MARK: - Counting occurrences of characters
// In some cases it doesn't really matter what
// representation is used, we just want to count.
//
// In this section we probe the various Swift string
// view with a number of approaches.

// MARK: - for (generated)

public func countNewlinesCharactersFor(_ s: String) -> Int {
    var count = 0
    for c in s {
        if c == characterNewline {
            count += 1
        }
    }
    return count
}


public func countNewlinesUnicodeScalarsFor(_ s: String) -> Int {
    var count = 0
    for c in s.unicodeScalars {
        if c == unicodeScalarNewline {
            count += 1
        }
    }
    return count
}


public func countNewlinesUTF16For(_ s: String) -> Int {
    var count = 0
    for c in s.utf16 {
        if c == unicharNewline {
            count += 1
        }
    }
    return count
}


public func countNewlinesUTF8For(_ s: String) -> Int {
    var count = 0
    for c in s.utf8 {
        if c == utf8Newline {
            count += 1
        }
    }
    return count
}


// MARK: - for where (generated)

public func countNewlinesCharactersForWhere(_ s: String) -> Int {
    var count = 0
    for c in s where c == characterNewline {
        count += 1
    }
    return count
}


public func countNewlinesUnicodeScalarsForWhere(_ s: String) -> Int {
    var count = 0
    for c in s.unicodeScalars where c == unicodeScalarNewline {
        count += 1
    }
    return count
}


public func countNewlinesUTF16ForWhere(_ s: String) -> Int {
    var count = 0
    for c in s.utf16 where c == unicharNewline {
        count += 1
    }
    return count
}


public func countNewlinesUTF8ForWhere(_ s: String) -> Int {
    var count = 0
    for c in s.utf8 where c == utf8Newline {
        count += 1
    }
    return count
}

// MARK: - Map Filter

public func countNewlinesCharactersMapFilter(_ s: String) -> Int {
    return s.map { $0 }
            .filter { $0 == characterNewline }
            .count
}

public func countNewlinesUnicodeScalarsMapFilter(_ s: String) -> Int {
    return s.unicodeScalars.map { $0 }
        .filter { $0 == unicodeScalarNewline }
        .count
}

public func countNewlinesUTF16MapFilter(_ s: String) -> Int {
    return s.utf16.map { $0 }
        .filter { $0 == unicharNewline }
        .count
}

public func countNewlinesUTF8MapFilter(_ s: String) -> Int {
    return s.utf8.map { $0 }
        .filter { $0 == utf8Newline }
        .count
}

// MARK: - Array

public func countNewlinesUTF16ArrayFor(_ a: [unichar]) -> Int {
    var count = 0
    for c in a {
        if c == 10 {
            count += 1
        }
    }
    return count
}

public func countNewlinesUTF8ArrayFor(_ a: [UInt8]) -> Int {
    var count = 0
    for c in a {
        if c == utf8Newline {
            count += 1
        }
    }
    return count
}

// MARK: - NSString

public func countNewlinesNSStringCharacterAt(_ s: String) -> Int {
    var count = 0
    let ns = s as NSString
    for i in 0..<ns.length {
        if ns.character(at: i) == unicharNewline {
            count += 1
        }
    }
    return count
}

// MARK: - Unsafe - Here be Dragons

// Thanks to Alexis Gallegher
// https://gist.github.com/algal/8ecfae13cb1b5044ef9a6526f8e5a9ab
public func countNewlinesUTF16UnsafeRebound(_ s: String) -> Int {
    let ns = s as NSString
    guard let startPtr:UnsafePointer<Int8> = ns.cString(using: String.Encoding.utf16.rawValue) else { return -1 }
    var count = 0
    startPtr.withMemoryRebound(to: Int16.self, capacity: ns.length) {
        (p:UnsafePointer<Int16>) -> Void in
        for i in 0..<ns.length  where p.advanced(by: i).pointee == 10
        {
            count += 1
        }
    }
    return count
}
