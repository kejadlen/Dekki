//
//  Models.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import Foundation

class DeckBuilder {

    var exerciseDefinitions = ExerciseDefinition.allCases

    func build() -> [Card] {
        return exerciseDefinitions.flatMap { exercise in
            return (1..<14).map { reps in
                return Card(reps: reps, exercise: exercise)
            }
        }.shuffled()
    }

}

enum ExerciseDefinition: CaseIterable {
    case jumpingJack, pushUp, sitUp, squat
}

struct Card: CustomStringConvertible {
    let reps: UInt
    let exercise: ExerciseDefinition

    var description: String {
        String.localizedStringWithFormat(
            NSLocalizedString("%d \(exercise) reps", comment: ""),
            reps
        )
    }
}
