//
//  File.swift
//  MyLibrary
//
//  Created by 安宅正之 on 2024/11/05.
//

import Foundation

/// 反復
public struct MyIteration { public init(){} }
/// 再帰
public struct Recursive   { public init(){} }
/// 末尾再帰
public struct TailRecursive { public init(){} }
/// トランポリン再帰
public struct TrampolineRecursive { public init(){} }

// MARK: Sum

public extension MyIteration {
    func sum(_ number: Int) -> Int {
        var sum: Int = 0
        for i in 1...number {
            sum += i
        }
        return sum
    }
}

public extension Recursive {
    // Stackover flow Debug 130,444? Release 261,000?
    func sum(_ number: Int) -> Int {
        guard number > 0 else { return 0 }
        return number + sum(number - 1)
    }
}

public extension TailRecursive {
    func sum(_ number: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> Int {
            guard number > 0 else { return acc }
            return innerSum(number - 1, acc: acc + number)
        }
        return innerSum(number, acc: 0)
    }
}

public extension TrampolineRecursive {
    enum MyRuselt {
        case done(Int)
        case call(() -> MyRuselt)
    }

    func sum(_ num: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> MyRuselt {
            guard number > 0 else { return .done(acc) }
            return .call( { innerSum(number - 1, acc: acc + number) })
        }

        // Trampoline seciton
        var result = innerSum(num, acc: 0)
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
