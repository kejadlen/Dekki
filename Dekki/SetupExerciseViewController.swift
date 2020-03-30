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
    @IBOutlet weak var faceCardsSegmentedControl: UISegmentedControl!

    var exerciseConfig: ExerciseConfig! {
        didSet { render() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        exerciseLabel.text = "\(exerciseConfig!.exercise)"
        aceRepsSegmentedControl.selectedSegmentIndex = Int(exerciseConfig!.aceConfig.rawValue)
    }

    @IBAction func aceRepsChanged(_ sender: UISegmentedControl) {
        var aceReps: AceConfig
        switch sender.selectedSegmentIndex {
        case 0: aceReps = .low
        case 1: aceReps = .high
        default: fatalError()
        }

        exerciseConfig.aceConfig = aceReps
    }

    @IBAction func unwindFromSelectExercise(segue: UIStoryboardSegue) {
        guard
            let vc = segue.source as? SelectExerciseViewController,
            let exercise = vc.selectedExercise
        else { return }

        exerciseConfig.exercise = exercise
        exerciseLabel.text = "\(exerciseConfig!.exercise)"
    }

    private func render() {
        guard view != nil else { return }
    }

}
