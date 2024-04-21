import Foundation
import XCTest

enum Solution {

    /// Determines whether two words are anagrams of each other. Two empty
    /// strings are considered as anagrams.
    /// An anagram is a word or phrase formed by rearranging the letters of a
    /// different word or phrase, typically using all the original letters
    /// exactly once. Example:
    /// ```swift
    /// let word1 = "listen"
    /// let word2 = "silent"
    /// let result = Solution.isAnagram(word1, word2) // true
    /// ```
    /// - Note: The comparison is case-sensitive, meaning 'A' and 'a' are
    /// considered different characters.
    ///
    /// - Parameters:
    ///   - s: The first word to be considered.
    ///   - t: The second word to be considered.
    /// - Returns: `true` if the words are anagrams; otherwise, `false`.
    /// - Complexity: O(`n` + `m`), where `n` and `m` are the lengths of
    /// the inputted strings.
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        var numberOfChars = [String.Element: Int]()
        s.forEach { char in
            numberOfChars[char, default: 0] += 1
        }
        for char in t {
            if var value = numberOfChars[char] {
                value -= 1
                numberOfChars[char] = value == 0 ? nil : value
            } else {
                return false
            }
        }
        return numberOfChars.isEmpty
    }
}

final class IsAnagramTests: XCTestCase {
    func testOne() {
        let t = ""
        let s = ""
        XCTAssertTrue(Solution.isAnagram(t, s))
    }

    func testTwo() {
        let t = "a"
        let s = "a"
        XCTAssertTrue(Solution.isAnagram(t, s))
    }

    func testThree() {
        let t = "ab"
        let s = "ba"
        XCTAssertTrue(Solution.isAnagram(t, s))
    }

    func testFour() {
        let t = "aa"
        let s = "ba"
        XCTAssertFalse(Solution.isAnagram(t, s))
    }

    func testFive() {
        let t = "nagaram"
        let s = "anagram"
        XCTAssertTrue(Solution.isAnagram(t, s))
    }
}

IsAnagramTests.defaultTestSuite.run()
