//
//  RecursiveView.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/11/05.
//

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
    }

    // MARK: Recursive Funcs

    
}

#Preview {
    RecursiveView()
}
