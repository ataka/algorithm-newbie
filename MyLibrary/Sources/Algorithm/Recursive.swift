//
//  File.swift
//  MyLibrary
//
//  Created by 安宅正之 on 2024/11/05.
//

import Foundation

// MARK: 1 から N までの足し算をする関数

public struct MyIteration { public init(){} }
public struct Recursive   { public init(){} }
public struct TailRecursive { public init(){} } // 末尾再帰最適化 = 末尾再帰 + コンパイラ
public struct TrampolineRecursive { public init(){} }

public extension MyIteration {
    func sum(_ number: Int) -> Int {
        var sum: Int = 0
        for i in 1...number {
            sum += i
        }
        return sum
    }
}

// 10 -> 9 -> 8 -> .... -> 0
// sum(10) = 10 + sum(9)
//   sum(9) = 9 + sum(8)
//   sum(1) = 1 + sum(0) // 終端
public extension Recursive {
    func sum(_ number: Int) -> Int {
        guard number > 0 else { return 0 }
        return number + sum(number - 1)
    }
}

public extension TailRecursive {
    func sum(_ number: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> Int { // acc = accumulator
            guard number > 0 else { return acc }
            return innerSum(number - 1, acc: acc + number)
        }
        return innerSum(number, acc: 0)
    }
}

public extension TrampolineRecursive {
    enum MyResult {
        case done(Int)
        case call(() -> MyResult)
    }
    
    func sum(_ number: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> MyResult { // acc = accumulator
            guard number > 0 else { return .done(acc) }
            return .call({ innerSum(number - 1, acc: acc + number) })
        }

        var result = innerSum(number, acc: 0)
        while true {
            switch result {
            case .done(let acc):
                return acc
            case .call(let f):
                result = f()
            }
        }
    }
}

// MARK: 偶数・奇数を判定する - 相互再帰

public extension Recursive {
    func isEven(_ number: Int) -> Bool {
        if number == 0 { true } else { isOdd(number - 1) }
    }
    func isOdd(_ number: Int) -> Bool {
        if number == 0 { false } else { isEven(number - 1) }
    }
}

// MARK: Fibonacci 数

// Fibonacci 数
// F(n) = F(n-1) + F(n-2)
// F(1) = 1
// F(2) = 1
// 1, 1, 2, 3, 5, 8, 13, 21, ....
public extension Recursive {
    func fib(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 1 }
        return fib(n - 1) + fib(n - 2) // O(2^n) -> O(n)
    }
}
