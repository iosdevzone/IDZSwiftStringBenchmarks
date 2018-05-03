import XCTest
@testable import IDZSwiftStringBenchmarks

final class IDZSwiftStringBenchmarksTests: XCTestCase {
    let testString = try! String(contentsOfFile: "/usr/share/dict/words", encoding: .utf8)
    let expected = 235886
    
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
    
    func testCountNewlinesCharactersForWhere() {
        self.measure {
            let nlc = countNewlinesCharactersForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
    func testCountNewlinesUTF16ForWhere() {
        self.measure {
            let nlc = countNewlinesUTF16ForWhere(testString)
            XCTAssertEqual(nlc, expected)
        }
    }
    
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

    static var allTests = [
        ("testCountNewlinesCharactersFor", testCountNewlinesCharactersFor),
    ]
}
