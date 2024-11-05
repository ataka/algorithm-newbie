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
    typealias InnerFunction<T> = () -> MyResult<T>
    enum MyResult<T> {
        case done(T)
        case call(InnerFunction<T>) // () -> MyResult<T>
    }

    fileprivate func runTrampoline<T>(_ initialResult: MyResult<T>) -> T {
        var result = initialResult
        while true {
            switch result {
            case .done(let acc):
                return acc
            case .call(let f):
                result = f()
            }
        }
    }

    func sum(_ num: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> MyResult<Int> {
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

    func sum1(_ num: Int) -> Int {
        func innerSum(_ number: Int, acc: Int) -> MyResult<Int> {
            guard number > 0 else { return .done(acc) }
            return .call( { innerSum(number - 1, acc: acc + number) })
        }

        // Trampoline seciton
        return runTrampoline(innerSum(num, acc: 0))
    }
}

// MARK: isEven

public extension MyIteration {
    func isEven(_ number: Int) -> Bool {
        var isEven: Bool = true
        for _ in 1...number {
            isEven.toggle()
        }
        return isEven
    }
}

public extension Recursive {
    // Stack overflow 173,969
    func isEven(_ number: Int) -> Bool {
        if number == 0 { true }
        else { isOdd(number - 1) }
    }

    func isOdd(_ number: Int) -> Bool {
        if number == 0 { false }
        else { isEven(number - 1) }
    }
}

public extension TailRecursive {
    func isEven(_ number: Int) -> Bool {
        func innerIsEven(_ number: Int, acc: Bool) -> Bool {
            if number == 0 { acc }
            else { innerIsOdd(number - 1, acc: !acc) }
        }
        func innerIsOdd(_ number: Int, acc: Bool) -> Bool {
            if number == 0 { acc }
            else { innerIsEven(number - 1, acc: !acc) }
        }
        return innerIsEven(number, acc: true)
    }
}

public extension TrampolineRecursive {
    func isEven(_ number: Int) -> Bool {
        func innerIsEven(_ number: Int) -> MyResult<Bool> {
            if number == 0 { .done(true) }
            else { .call( { innerIsOdd(number - 1) }) }
        }
        func innerIsOdd(_ number: Int) -> MyResult<Bool> {
            if number == 0 { .done(false) }
            else { .call( { innerIsEven(number - 1)} ) }
        }

        // Trampoline seciton
        var result = innerIsEven(number)
        while true {
            switch result {
            case .done(let acc):
                return acc
            case .call(let f):
                result = f()
            }
        }
    }

    func isEven1(_ number: Int) -> Bool {
        func innerIsEven(_ number: Int) -> MyResult<Bool> {
            if number == 0 { .done(true) }
            else { .call( { innerIsOdd(number - 1) }) }
        }
        func innerIsOdd(_ number: Int) -> MyResult<Bool> {
            if number == 0 { .done(false) }
            else { .call( { innerIsEven(number - 1)} ) }
        }

        // Trampoline seciton
        return runTrampoline(innerIsEven(number))
    }
}
// MARK: Fibonacci

public extension Recursive {
    func fib(_ n: Int) -> Int {
        if n <= 2 { return 1 }
        return fib(n - 1) + fib(n - 2)
    }
}

public extension TailRecursive {
    // fib(n) = fib(n-1) + fib(n-2)
    // fib(n+1) = fib(n) + fib(n-1)
    func fib(_ n: Int) -> Int {
        func innerFib(_ n: Int, count: Int, fibN: Int, fibN_1: Int) -> Int {
            if count == n { return fibN_1 }
            return innerFib(n, count: count + 1, fibN: fibN + fibN_1, fibN_1: fibN)
        }
        return innerFib(n, count: 1, fibN: 1, fibN_1: 1)
    }

    func fib1(_ n: Int) -> Int {
        // fibN is accumulator
        func innerFib(_ n: Int, fibN: Int, fibN_1: Int) -> Int {
            if n <= 0 { return fibN }
            return innerFib(n - 1, fibN: fibN + fibN_1, fibN_1: fibN)
        }
        return innerFib(n, fibN: 1, fibN_1: 1)
    }
}

public extension TrampolineRecursive {
    func fib(_ n: Int) -> Int {
        func innerFib(_ n: Int, fibN: Int, fibN_1: Int) -> MyResult<Int> {
            if n <= 0 { return .done(fibN) }
            return .call({ innerFib(n - 1, fibN: fibN + fibN_1, fibN_1: fibN) })
        }
        return runTrampoline(innerFib(n, fibN: 1, fibN_1: 1))
    }
}
