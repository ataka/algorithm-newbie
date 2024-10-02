//
//  MainView.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/10/02.
//

import SwiftUI
import Algorithm

struct MainView: View {
    var body: some View {
        VStack {
            Text("Hash Table")
                .font(.title)
            Button {
                runPlayground()
            } label: {
                Text("Run Playground")
            }

            List {
                ForEach(0..<26) { index in
                    Text(fruits[index].description)
                }
            }
        }
    }

    func runPlayground() {
        print("Please set a breakpoint")
        print(Origin.value)
    }
}

#Preview {
    MainView()
}
