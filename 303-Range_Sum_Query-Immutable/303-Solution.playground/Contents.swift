class NumArray {
    // MARK: - Internal interface

    init(_ nums: [Int]) {
        self.nums = nums
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        nums[left...right].reduce(0, +)
    }

    // MARK: - Private interface

    private let nums: [Int]
}

let array1 = [1, -7, 5, 0, 12, 6]
let array2 = [11, -11, 5, 10, 12, 6]

let obj1 = NumArray(array1)
let ret_1 = obj1.sumRange(0, 4)
assert(ret_1 == 11, "fail")

let obj2 = NumArray(array2)
let ret_2 = obj2.sumRange(2, 3)
assert(ret_2 == 15, "fail")