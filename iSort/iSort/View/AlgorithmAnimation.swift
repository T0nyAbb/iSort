//
//  AlgorithmAnimation.swift
//  iSort
//
//  Created by Antonio Abbatiello on 03/04/24.
//

import SwiftUI

struct AlgorithmAnimation: View {
    
    var algorithm: Algorithm
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        GifView(algorithm.name)
            .onTapGesture {
                openURL(URL(string: "https://www.pinterest.com/vivienhughs/")!)
            }
    }
}

#Preview {
    AlgorithmAnimation(algorithm: Algorithm(name: "tetst", complexity: "nnn"))
}
