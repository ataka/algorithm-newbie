//
//  HashTable.swift
//  MyLibrary
//
//  Created by 安宅正之 on 2024/10/03.
//

import Foundation

public protocol MyHashable: Equatable {
    var hashValue: Int { get }
}

public struct HashTable1<Key: MyHashable, Value> {
    private var storage: [Value?]
    private var capacitySize: Int = 7

    public init() {
        storage = Array<Value?>(repeating: nil, count: capacitySize)
    }

    public func value(for key: Key) -> Value? {
        let index = hashFunction(for: key)
        return storage[index]
    }

    public mutating func set(_ value: Value?, for key: Key) {
        let index = hashFunction(for: key)
        storage[index] = value
    }

    private func hashFunction(for key: Key) -> Int {
        key.hashValue % capacitySize
    }
}

public struct HashTable2<Key: MyHashable, Value> {
    private struct Bucket {
        let key: Key
        let value: Value
    }
    private var storage: [[Bucket]]
    private var capacitySize: Int = 7

    public init() {
        storage = Array(repeating: [], count: capacitySize)
    }

    public func value(for key: Key) -> Value? {
        let index = hashFunction(for: key)
        let listIndex = getListIndex(for: key, andIndex: index)
        return if let listIndex {
            storage[index][listIndex].value
        } else {
            nil
        }
    }

    public mutating func set(_ value: Value?, for key: Key) {
        if let value {
            let index = hashFunction(for: key)
            let listIndex = getListIndex(for: key, andIndex: index)
            let bucket = Bucket(key: key, value: value)
            if let listIndex {
                storage[index][listIndex] = bucket
            } else {
                storage[index].append(bucket)
            }
        } else {
            remove(for: key)
        }
    }

    public mutating func remove(for key: Key) {
        let index = hashFunction(for: key)
        let listIndex = getListIndex(for: key, andIndex: index)
        guard let listIndex else { return }
        storage[index].remove(at: listIndex)
    }

    private func hashFunction(for key: Key) -> Int {
        key.hashValue % capacitySize
    }

    private func getListIndex(for key: Key, andIndex index: Int) -> Int? {
        storage[index].firstIndex { $0.key == key }
    }
}
