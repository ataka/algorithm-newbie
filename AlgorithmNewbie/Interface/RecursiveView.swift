//
//  RecursiveView.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/11/05.
//

import Algorithm
import SwiftUI

struct RecursiveView: View {
    @State var text: String = ""

    var body: some View {
        VStack {
            Text("Recursive")
                .font(.title)
            Button {
                runPlayground()
            } label: {
                Text("Run Playground")
            }
            Console(text: text)
        }
    }

    private func puts(_ string: String) {
        let newLine = text.isEmpty ? "" : "\n"
        self.text.append(newLine + string)
    }

    private func runPlayground() {
        print("=== Run Playground ===")
        sum()
    }

    // MARK: Recursive Funcs

    private func sum() {
//        let number = 300_000
        let number = 100
        let iteration = MyIteration()
        let recursive = Recursive()
        let tailRecursive = TailRecursive()
        let trampoline = TrampolineRecursive()

        puts("iteration: sum(\(number)) = \(iteration.sum(number))")
        puts("recursive: sum(\(number)) = \(recursive.sum(number))")
        puts("tail recursive: sum(\(number)) = \(tailRecursive.sum(number))")
        puts("trampoline recursive: sum(\(number)) = \(trampoline.sum(number))")
    }
}

#Preview {
    RecursiveView()
}
