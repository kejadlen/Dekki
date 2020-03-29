//
//  ViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SetupDeckViewController: UITableViewController {
    
    let exercises: [Suit: String] = [
        .clubs: "Jumping Jacks",
        .diamonds: "Push-ups",
        .hearts: "Sit-ups",
        .spades: "Squats",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? WorkoutViewController else { return }
        
        vc.exercises = exercises
    }

    @IBAction func unwindFromWorkout(segue: UIStoryboardSegue) {
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let suit = Suit(rawValue: indexPath.row)!
        let exercise = exercises[suit]
        cell.textLabel!.text = "\(suit)"
        cell.detailTextLabel!.text = exercise
        return cell
    }
    
}

// MARK: - SuitExerciseCell

class SuitExerciseCell: UITableViewCell {
    
}
