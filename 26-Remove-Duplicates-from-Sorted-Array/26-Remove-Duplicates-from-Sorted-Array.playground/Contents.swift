import Foundation
import XCTest

enum RemoveDuplicatesSolution {
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        var uniqueElementIndex = nums.startIndex
        var nextUniqueElementIndex = uniqueElementIndex + 1

        while nextUniqueElementIndex < nums.endIndex {
            if nums[nextUniqueElementIndex] == nums[uniqueElementIndex] {
                nextUniqueElementIndex += 1
            } else {
                uniqueElementIndex += 1
                nums.swapAt(uniqueElementIndex, nextUniqueElementIndex)
                nextUniqueElementIndex += 1
            }
        }
        let uniqueElementCount = uniqueElementIndex + 1
        return uniqueElementCount
    }
}

final class RemoveDuplicatesSolutionTest: XCTestCase {
    func testOne() {
        var nums = [1, 1, 2]
        XCTAssertEqual(RemoveDuplicatesSolution.removeDuplicates(&nums), 2)
    }

    func testTwo() {
        var nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        XCTAssertEqual(RemoveDuplicatesSolution.removeDuplicates(&nums), 5)
    }
}

RemoveDuplicatesSolutionTest.defaultTestSuite.run()
