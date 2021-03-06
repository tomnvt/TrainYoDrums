//
//  SimpleHouseExampleBeat.swift
//  DrumTrainer
//
//  Created by NVT on 06.09.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import Foundation
import RealmSwift

class SimpleHouseExampleBeat: ExampleBeatNotes {

    let exampleBeatNotes = { () -> [[Int]] in
        var drumPadNotes: [[Int]] = []
        let eighthsArray = [0, 0, 0, 0, 0, 0, 0, 0,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            0, 0, 0, 0, 0, 0, 0, 0]
        for _ in 0...15 {
            drumPadNotes.append(eighthsArray)
        }
        drumPadNotes[0] = [1, 0, 0, 0, 0, 0, 0, 0,
                           1, 0, 0, 0, 0, 0, 0, 0,
                           1, 0, 0, 0, 0, 0, 0, 0,
                           1, 0, 0, 0, 0, 0, 0, 0]
        drumPadNotes[1] = [0, 0, 0, 0, 0, 0, 0, 0,
                           1, 0, 0, 0, 0, 0, 0, 0,
                           0, 0, 0, 0, 0, 0, 0, 0,
                           1, 0, 0, 0, 0, 0, 0, 0]
        drumPadNotes[2] = [0, 0, 0, 0, 1, 0, 0, 0,
                           0, 0, 0, 0, 1, 0, 0, 0,
                           0, 0, 0, 0, 1, 0, 0, 0,
                           0, 0, 0, 0, 1, 0, 0, 0]
        return drumPadNotes
    }()

    override init() {
        super.init()
        ExampleBeatNotes.saveExampleBeatToRealm(beatNotes: exampleBeatNotes, beatName: "Simple House")
        firstBarDrumNotes = exampleBeatNotes
    }

}
