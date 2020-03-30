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
    var faceConfig: FaceConfig = .rank

    var aceReps: UInt { aceReps(with: aceConfig) }

    func aceReps(with aceConfig: AceConfig) -> UInt {
        switch (aceConfig, faceConfig) {
        case (.none, _): return 0
        case (.low, _): return 1
        case (.high, .none), (.high, .ten): return 10
        case (.high, .rank): return 14
        }
    }

    func faceReps(for rank: UInt) -> UInt {
        switch faceConfig {
        case .none: return 0
        case .ten: return 10
        case .rank: return rank
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
    case none = 0, low, high
}

enum FaceConfig: UInt, CaseIterable {
    case none = 0, ten, rank
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
