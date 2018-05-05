import XCTest
@testable import IDZSwiftStringBenchmarks

final class IDZSwiftStringBenchmarksTests: XCTestCase {
    let testString = try! String(contentsOfFile: "/usr/share/dict/words", encoding: .utf8)
    let expected = 235886

    // MARK: - NSString
    func testCountNewlinesNSStringCharacterAt() {
        self.measure {
            let nlc = countNewlinesNSStringCharacterAt(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesNSStringCharactersAtObjC() {
        self.measure {
            let nlc = IDZSwiftStringBenchmarksObjC.countNewlinesNSStringCharacter(atObjC: testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesNSStringUTF16PointerObjC() {
        self.measure {
            let nlc = IDZSwiftStringBenchmarksObjC.countNewlinesNSStringUTF16PointerObjC(testString)
            XCTAssertEqual(nlc, expected)
        }
    }

    func testCountNewlinesNSStringUTF8PointerObjC() {
        self.measure {
            let nlc = IDZSwiftStringBenchmarksObjC.countNewlinesNSStringUTF8PointerObjC(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesUTF16UnsafeRebound() {
        self.measure {
            let nlc = countNewlinesUTF16UnsafeRebound(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesUTF16ArrayFor() {
        self.measure {
            let a = testString.utf16.map { $0 }
            let nlc = countNewlinesUTF16ArrayFor(a)
            XCTAssertEqual(nlc, expected)
        }
    }

    func xtestCountNewlinesUTF8ArrayFor() {
        self.measure {
            let a = testString.utf8.map { $0 }
            let nlc = countNewlinesUTF8ArrayFor(a)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesUTF8ArrayForPrefixHack() {
        self.measure {
            // Yes, this is a no-op but it makes this test
            // run an order or magnitude to two faster than
            // the above.
            // See: https://bugs.swift.org/browse/SR-7598
            let s = String(testString.prefix(testString.count))
            let a = s.utf8.map { $0 }
            let nlc = countNewlinesUTF8ArrayFor(a)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    // If the data happened to "naturally" be in UTF-16
    // this might be viable.
    func testCountNewlinesUTF16ArrayForExcludingConversion() {
        let a = testString.utf16.map { $0 }
        self.measure {
            let nlc = countNewlinesUTF16ArrayFor(a)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    static var allTests = [
        ("testCountNewlinesCharactersFor", testCountNewlinesCharactersFor),
    ]
    
    // MARK: - GENERATED TESTS DON'T HAND EDIT
    // MARK: - For (generated)
    func testCountNewlinesCharactersFor() {
        self.measure {
            let nlc = countNewlinesCharactersFor(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUnicodeScalarsFor() {
        self.measure {
            let nlc = countNewlinesUnicodeScalarsFor(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUTF16For() {
        self.measure {
            let nlc = countNewlinesUTF16For(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUTF8For() {
        self.measure {
            let nlc = countNewlinesUTF8For(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    // MARK: - ForWhere (generated)
    func testCountNewlinesCharactersForWhere() {
        self.measure {
            let nlc = countNewlinesCharactersForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUnicodeScalarsForWhere() {
        self.measure {
            let nlc = countNewlinesUnicodeScalarsForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUTF16ForWhere() {
        self.measure {
            let nlc = countNewlinesUTF16ForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUTF8ForWhere() {
        self.measure {
            let nlc = countNewlinesUTF8ForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    // MARK: - MapFilter (generated)
    func testCountNewlinesCharactersMapFilter() {
        self.measure {
            let nlc = countNewlinesCharactersMapFilter(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUnicodeScalarsMapFilter() {
        self.measure {
            let nlc = countNewlinesUnicodeScalarsMapFilter(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    
    func testCountNewlinesUTF16MapFilter() {
        self.measure {
            let nlc = countNewlinesUTF16MapFilter(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    // This disabled because it takes minutes to run
    // See: https://bugs.swift.org/browse/SR-7598
    func xtestCountNewlinesUTF8MapFilter() {
        self.measure {
            let nlc = countNewlinesUTF8MapFilter(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
}
