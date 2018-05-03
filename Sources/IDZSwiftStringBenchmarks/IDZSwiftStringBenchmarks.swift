import Foundation

let unicharNewline = unichar(10)
let unicodeScalarNewline = Unicode.Scalar(10)
let utf8newline = UInt8(10)
let characterNewline = Character("\n")

// MARK: - Counting occurrences of characters
// In some cases it doesn't really matter what
// representation is used, we just want to count.
//
// In this section we probe the various Swift string
// view with a number of approaches.

// MARK: for loops
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
        if c == 10 {
            count += 1
        }
    }
    return count
}

public func countNewlinesUTF8For(_ s: String) -> Int {
    var count = 0
    for c in s.utf8 {
        if c == 10 {
            count += 1
        }
    }
    return count
}

// MARK: for where loops
public func countNewlinesCharactersForWhere(_ s: String) -> Int {
    var count = 0
    for c in s where c == "\n" {
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

public func countNewlinesUnicodeUTF8ForWhere(_ s: String) -> Int {
    var count = 0
    for c in s.utf8 where c == utf8newline {
        count += 1
    }
    return count
}



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
