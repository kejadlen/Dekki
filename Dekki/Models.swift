//
//  Models.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.git
//

import Foundation

struct ExerciseDefinition {
    var exercise: Exercise
    var aceRepetitions: FaceRepetitions = .rank
}

enum Exercise: String, CaseIterable, CustomStringConvertible {
    case jumpingJack, pushUp, sitUp, squat

    var description: String {
        NSLocalizedString("\(self.rawValue)", comment: "")
    }
}

enum FaceRepetitions: UInt, CaseIterable {
    case one = 0
    case rank

    func reps(from rank: UInt) -> UInt {
        switch self {
        case .one: return 1
        case .rank: return rank
        }
    }
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
