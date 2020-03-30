//
//  SetupExerciseViewController.swift
//  Dekki
//
//  Created by Alpha on 3/29/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SetupExerciseViewController: UITableViewController {

    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var aceRepsSegmentedControl: UISegmentedControl!

    var exerciseDefinition: ExerciseDefinition!

    override func viewDidLoad() {
        super.viewDidLoad()

        exerciseLabel.text = "\(exerciseDefinition!.exercise)"
        aceRepsSegmentedControl.selectedSegmentIndex = Int(exerciseDefinition!.aceRepetitions.rawValue)
    }

    @IBAction func aceRepsChanged(_ sender: UISegmentedControl) {
        var aceReps: FaceRepetitions
        switch sender.selectedSegmentIndex {
        case 0: aceReps = .one
        case 1: aceReps = .rank
        default: fatalError()
        }

        exerciseDefinition.aceRepetitions = aceReps
    }

    @IBAction func unwindFromSelectExercise(segue: UIStoryboardSegue) {
        guard
            let vc = segue.source as? SelectExerciseViewController,
            let exercise = vc.selectedExercise
        else { return }

        exerciseDefinition.exercise = exercise
        exerciseLabel.text = "\(exerciseDefinition!.exercise)"
    }

}
