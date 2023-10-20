import Foundation

// MARK: - First Problem
public func findMissingElement(_ A : inout [Int]) -> Int {
    var hash = [Int:Int]()
    let n = A.count
    A.forEach({ x in
        hash[x]  = 1
    })
    for v in 1...n+1 {
        if hash[v] == nil {
            return v
        }
    }
    return -1
}

// MARK: - Result for first problem
var array = [2,3,1,5]
let missingElement = findMissingElement(&array)
print("The missing element is \(missingElement)")

// MARK: - Second Problem
public func findMaxCounters(_ N : Int, _ A : inout [Int]) -> [Int] {
    var counters = Array(repeating: 0, count: N)
    var maxCounter = 0
    var maxValue = 0
    A.forEach({ a in
        if a == N+1 {
            maxCounter = maxValue
        }
        else {
            counters[a-1] = max(maxCounter, counters[a-1]) + 1
            maxValue = max(maxValue, counters[a-1])
        }
    })
    counters.enumerated().forEach({ (i, c) in
        counters[i] = max(maxCounter, c)
    })
    return counters
}

// MARK: - Result for second problem
var arr = [3, 4, 4, 6, 1, 4, 4]
let maxCount = findMaxCounters(5 , &arr)
print("Max count is \(maxCount)")
