//
//  Models.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.git
//

import Foundation

struct ExerciseConfig {
    var exercise: Exercise
    var aceConfig: AceConfig = .high

    var aceReps: UInt {
        switch aceConfig {
        case .low: return 1
        case .high: return 14
        }
    }
}

enum Exercise: String, CaseIterable, CustomStringConvertible {
    case jumpingJack, pushUp, sitUp, squat

    var description: String {
        NSLocalizedString("\(self.rawValue)", comment: "")
    }
}

enum AceConfig: UInt, CaseIterable {
    case low = 0
    case high
}

struct Card: CustomStringConvertible {
    let reps: UInt
    let exercise: Exercise

    var description: String {
        String.localizedStringWithFormat(
            NSLocalizedString("%d \(exercise.rawValue) reps", comment: ""),
            reps
        )
    }
}
