//
//  MainView.swift
//  AlgorithmNewbie
//
//  Created by 安宅正之 on 2024/10/02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("Hash Table")
                .font(.title)
            List {
                ForEach(0..<26) { index in
                    Text(fruits[index].description)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
