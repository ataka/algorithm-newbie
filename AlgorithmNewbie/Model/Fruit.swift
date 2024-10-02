//
//  Fruit.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/10/02.
//

import Algorithm
import Foundation

struct Fruit: CustomStringConvertible {
    struct ID: CustomStringConvertible, MyHashable {
        let rawValue: Int

        var description: String { "\(rawValue)" }

        var hashValue: Int { rawValue }
    }

    let id: ID
    var name: String

    // MARK: CustomStringConvertible

    var description: String {
        "Fruit(id: \(id), name: \(name))"
    }
}

let fruits: [Fruit] = [
    Fruit(id: Fruit.ID(rawValue: 0),  name: "Apple"),
    Fruit(id: Fruit.ID(rawValue: 1),  name: "Banana"),
    Fruit(id: Fruit.ID(rawValue: 2),  name: "Cherry"),
    Fruit(id: Fruit.ID(rawValue: 3),  name: "Date"),
    Fruit(id: Fruit.ID(rawValue: 4),  name: "Elderberry"),
    Fruit(id: Fruit.ID(rawValue: 5),  name: "Fig"),
    Fruit(id: Fruit.ID(rawValue: 6),  name: "Grape"),
    Fruit(id: Fruit.ID(rawValue: 7),  name: "Honeydew"),
    Fruit(id: Fruit.ID(rawValue: 8),  name: "Indian Fig"),
    Fruit(id: Fruit.ID(rawValue: 9),  name: "Jackfruit"),
    Fruit(id: Fruit.ID(rawValue: 10), name: "Kiwi"),
    Fruit(id: Fruit.ID(rawValue: 11), name: "Lemon"),
    Fruit(id: Fruit.ID(rawValue: 12), name: "Mango"),
    Fruit(id: Fruit.ID(rawValue: 13), name: "Nectarine"),
    Fruit(id: Fruit.ID(rawValue: 14), name: "Orange"),
    Fruit(id: Fruit.ID(rawValue: 15), name: "Papaya"),
    Fruit(id: Fruit.ID(rawValue: 16), name: "Quince"),
    Fruit(id: Fruit.ID(rawValue: 17), name: "Raspberry"),
    Fruit(id: Fruit.ID(rawValue: 18), name: "Strawberry"),
    Fruit(id: Fruit.ID(rawValue: 19), name: "Tangerine"),
    Fruit(id: Fruit.ID(rawValue: 20), name: "Ugli Fruit"),
    Fruit(id: Fruit.ID(rawValue: 21), name: "Vanilla Bean"),
    Fruit(id: Fruit.ID(rawValue: 22), name: "Watermelon"),
    Fruit(id: Fruit.ID(rawValue: 23), name: "Xigua (Chinese Watermelon)"),
    Fruit(id: Fruit.ID(rawValue: 24), name: "Yellow Passion Fruit"),
    Fruit(id: Fruit.ID(rawValue: 25), name: "Zucchini (considered a fruit)"),
]
