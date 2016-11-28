import XCTest
@testable import SwiftSlug

class SwiftSlugTests: XCTestCase {
    func testSlugs() {
        if #available(OSX 10.11, *) {
            let test1 = "Hello, world!"
            let test2 = "This is a möre complícated tèst using accents"
            let test3 = "This is really 可愛い!"
            let test4 = "可愛い"

            // Linux and macOS handle Eszett differently right now
            let test5 = "Unter Straßen versteht man im Allgemeinen die dem öffentlichen Verkehr gewidmeten Straßen"

            let test6 = ""

            XCTAssertEqual(try test1.convertedToSlug(), "hello-world")
            XCTAssertEqual(try test2.convertedToSlug(), "this-is-a-more-complicated-test-using-accents")

            #if os(Linux)
                XCTAssertEqual(try test3.convertedToSlug(), "this-is-really")
                XCTAssertNil(try? test4.convertedToSlug())
                XCTAssertEqual(try test5.convertedToSlug(), "unter-strasen-versteht-man-im-allgemeinen-die-dem-offentlichen-verkehr-gewidmeten-strasen")                
            #else
                XCTAssertEqual(try test3.convertedToSlug(), "this-is-really-ke-aii")
                XCTAssertEqual(try test4.convertedToSlug(), "ke-aii")
                XCTAssertEqual(try test5.convertedToSlug(), "unter-strassen-versteht-man-im-allgemeinen-die-dem-offentlichen-verkehr-gewidmeten-strassen")                
            #endif

            XCTAssertNil(try? test6.convertedToSlug())
        }
    }

    static var allTests : [(String, (SwiftSlugTests) -> () throws -> Void)] {
        return [
            ("testSlugs", testSlugs),
        ]
    }
}
