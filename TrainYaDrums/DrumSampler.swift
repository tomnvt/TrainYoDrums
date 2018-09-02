//
//  DrumSampler.swift
//  DrumTrainer
//
//  Created by NVT on 01.09.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import Foundation

class DrumSampler: Sampler {

    override init() {
        super.init()
        loadSamples()
    }

    override func loadSamples() {
        sampleLoader.loadSamples(sampler: self, samples: sampleLibrary.drumSamples)
    }

}
