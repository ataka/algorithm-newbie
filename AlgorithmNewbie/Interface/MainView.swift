//
//  MainView.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/10/02.
//

import SwiftUI
import Algorithm

struct MainView: View {
    @State var text: String = ""

    var body: some View {
        VStack {
            Text("Hash Table")
                .font(.title)
            Button {
                runPlayground()
            } label: {
                Text("Run Playground")
            }
            Console(text: text)

            List {
                ForEach(0..<26) { index in
                    Text(fruits[index].description)
                }
            }
        }
    }

    private func puts(_ string: String) {
        let newLine = text.isEmpty ? "" : "\n"
        self.text.append(newLine + string)
    }

    private func runPlayground() {
        print("Please set a breakpoint")
        tryHashTable32()
    }

    private func tryHashTable32() {
        let apple = fruits[0]
        let banana = fruits[1]
        let cherry = fruits[2]
        let honeydew = fruits[7]

        var hashTable = HashTable32<Fruit.ID, Fruit>()
        hashTable.set(apple, for: apple.id)
        hashTable.set(banana, for: banana.id)

        puts("\(hashTable.value(for: apple.id)!)")
        puts("\(hashTable.value(for: banana.id)!)")
        puts("\(String(describing: hashTable.value(for: cherry.id)))")

        puts("# Collision")
        hashTable.set(honeydew, for: honeydew.id)
        puts("\(hashTable.value(for: honeydew.id)!)")
        puts("\(hashTable.value(for: apple.id)!)")

        hashTable.remove(for: apple.id)
        puts("\(hashTable.value(for: honeydew.id)!)")

        puts("Apple: \(String(describing: hashTable.value(for: apple.id)))")

        puts("# Extend Storage")
        puts("0 capacity size: \(hashTable.capacitySize)")
        hashTable.set(apple, for: apple.id)
        puts("1 capacity size: \(hashTable.capacitySize)")
    }

    private func tryHashTable31() {
        let apple = fruits[0]
        let banana = fruits[1]
        let cherry = fruits[2]
        let honeydew = fruits[7]

        var hashTable = HashTable31<Fruit.ID, Fruit>()
        hashTable.set(apple, for: apple.id)
        hashTable.set(banana, for: banana.id)

        puts("\(hashTable.value(for: apple.id)!)")
        puts("\(hashTable.value(for: banana.id)!)")
        puts("\(String(describing: hashTable.value(for: cherry.id)))")

        puts("# Collision")
        hashTable.set(honeydew, for: honeydew.id)
        puts("\(hashTable.value(for: honeydew.id)!)")
        puts("\(hashTable.value(for: apple.id)!)")

        hashTable.remove(for: apple.id)
        puts("\(String(describing: hashTable.value(for: honeydew.id)))")
    }

    private func tryHashTable2() {
        let apple = fruits[0]
        let banana = fruits[1]
        let cherry = fruits[2]
        let honeydew = fruits[7]

        var hashTable = HashTable2<Fruit.ID, Fruit>()
        hashTable.set(apple, for: apple.id)
        hashTable.set(banana, for: banana.id)

        puts("\(hashTable.value(for: apple.id)!)")
        puts("\(hashTable.value(for: banana.id)!)")
        puts("\(String(describing: hashTable.value(for: cherry.id)))")

        hashTable.set(honeydew, for: honeydew.id)
        puts("\(hashTable.value(for: honeydew.id)!)")
        puts("\(hashTable.value(for: apple.id)!)")

        hashTable.remove(for: apple.id)
        puts("\(hashTable.value(for: honeydew.id)!)")
        puts("\(String(describing: hashTable.value(for: apple.id)))")

        // Extend Storage
        puts("# Extend Storage")
        let orange = fruits[14]
        let vanillaBean = fruits[21]
        puts("0 capacity size: \(hashTable.capacitySize)")
        hashTable.set(apple, for: apple.id)
        hashTable.set(orange, for: orange.id)
        puts("1 capacity size: \(hashTable.capacitySize)")
        hashTable.set(vanillaBean, for: vanillaBean.id)
        puts("2 capacity size: \(hashTable.capacitySize)")
    }

    private func tryHashTable1() {
        let apple = fruits[0]
        let banana = fruits[1]
        let cherry = fruits[2]
        let honeydew = fruits[7]

        var hashTable = HashTable1<Fruit.ID, Fruit>()
        hashTable.set(apple, for: apple.id)
        hashTable.set(banana, for: banana.id)

        puts("\(hashTable.value(for: apple.id)!)")
        puts("\(hashTable.value(for: banana.id)!)")
        puts("\(String(describing: hashTable.value(for: cherry.id)))")

        hashTable.set(honeydew, for: honeydew.id)
        puts("\(hashTable.value(for: honeydew.id)!)")
        puts("\(hashTable.value(for: apple.id)!)")
    }
}

struct Console: View {
    var text: String

    var body: some View {
        if !text.isEmpty {
            Text(text)
                .font(.system(.body, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.black.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
        }
    }
}

#Preview {
    MainView()
}
