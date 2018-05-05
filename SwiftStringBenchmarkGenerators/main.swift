//
//  main.swift
//  SwiftStringBenchmarkGenerators
//
//  Created on 5/4/18.
//

import Foundation

/* (name, view, newlineCharacter, type) */
let methods = [
    ("Characters", "", "characterNewline", "Character"),
    ("UnicodeScalars", ".unicodeScalars", "unicodeScalarNewline", "UInt32"),
    ("UTF16", ".utf16", "unicharNewline", "UInt16"),
    ("UTF8", ".utf8", "utf8Newline", "UInt8")
]

/* template for copy and pasting */
public func generateTemplate() {
    for (name, view, character, _) in methods {
        let code = """
        """
        print(code + "\n\n")
    }
}

public func generateFor() {
    print("// MARK: - for (generated)\n")
    for (name, view, character, _) in methods {
        let code = """
        public func countNewlines\(name)For(_ s: String) -> Int {
            var count = 0
            for c in s\(view) {
                if c == \(character) {
                    count += 1
                }
            }
            return count
        }
        """
        print(code + "\n\n")
    }
}

public func generateForWhere() {
    print("// MARK: - for where (generated)\n")
    for (name, view, character, _) in methods {
        let code = """
            public func countNewlines\(name)ForWhere(_ s: String) -> Int {
                var count = 0
                for c in s\(view) where c == \(character) {
                    count += 1
                }
                return count
            }
            """
        print(code + "\n\n")
    }
}

public func generateMapFilter() {
    for method in methods {
        let (name, view, character, _) = method
        let code = """
        public func countNewlines\(name)MapFilter(_ s: String) -> Int {
            return s\(view).map { $0 }
                    .filter { $0 == \(character) }
                    .count
        }
        """
        print(code + "\n\n")
    }
}

public func generateTests() {
    let testNames = [ "For", "ForWhere", "MapFilter" ]
    for testName in testNames {
        print("// MARK: - \(testName) (generated)")
        for (name, _, _, _) in methods {
            let code = """
            func testCountNewlines\(name)\(testName)() {
                self.measure {
                    let nlc = countNewlines\(name)\(testName)(testString)
                    XCTAssertEqual(nlc, expected)
                }
            }
            """
            print(code + "\n\n")
        }
    }
}



generateFor()
generateForWhere()
generateMapFilter()

generateTests()
