//
//  HashTable.swift
//  MyLibrary
//
//  Created by 安宅正之 on 2024/10/02.
//

import Foundation

public protocol MyHashable {
    var hashValue: Int { get }
}

///  Collision を考慮しない一番シンプルな HashTable
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
