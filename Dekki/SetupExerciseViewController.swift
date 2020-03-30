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
    @IBOutlet weak var faceRepsSegmentedControl: UISegmentedControl!

    var exerciseConfig: ExerciseConfig! {
        didSet { render() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        render()
    }

    @IBAction func aceConfigChanged(_ sender: UISegmentedControl) {
        exerciseConfig.aceConfig = AceConfig(rawValue: UInt(sender.selectedSegmentIndex))!
    }

    @IBAction func faceConfigChanged(_ sender: UISegmentedControl) {
        exerciseConfig.faceConfig = FaceConfig(rawValue: UInt(sender.selectedSegmentIndex))!
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

        exerciseLabel.text = "\(exerciseConfig!.exercise)"

        aceRepsSegmentedControl.setTitle(
            String.localizedStringWithFormat(NSLocalizedString("aceHigh", comment: ""), exerciseConfig.aceReps(with: .high)),
            forSegmentAt: Int(AceConfig.high.rawValue)
        )
        aceRepsSegmentedControl.selectedSegmentIndex = Int(exerciseConfig!.aceConfig.rawValue)
        faceRepsSegmentedControl.selectedSegmentIndex = Int(exerciseConfig!.faceConfig.rawValue)
    }

}
