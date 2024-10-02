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
        puts(Origin.value)
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
