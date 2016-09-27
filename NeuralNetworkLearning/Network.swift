//
//  Network.swift
//  NeuralNetworkLearning
//
//  Created by WANG WEI on 2016/09/27.
//  Copyright © 2016年 OneV's Den. All rights reserved.
//

import Foundation

struct Network {
    let sizes: [Int]
    let numOfLayers: Int
    let biases: [[[Double]]]
    let weights: [[[Double]]]
    
    init(sizes: [Int]) {
        self.sizes = sizes
        self.numOfLayers = sizes.count
        
        var biases = [[[Double]]]()
        for y in sizes[1 ..< sizes.count] {
            biases.append(randNormals(0, 1, y, 1))
        }
        self.biases = biases
        
        var weights = [[[Double]]]()
        for (x, y) in zip(sizes[0..<sizes.count-1], sizes[1..<sizes.count]) {
            weights.append(randNormals(0, 1, y, x))
        }
        self.weights = weights
    }
}

func sigmoid(z: Double) -> Double {
    return 1.0 / (1.0 + exp(-z))
}
