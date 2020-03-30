//
//  SelectExerciseViewController.swift
//  Dekki
//
//  Created by Alpha on 3/29/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SelectExerciseViewController: UITableViewController {

    var selectedExercise: Exercise? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        return Exercise.allCases[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Exercise.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let exercise = Exercise.allCases[indexPath.row]
        cell.textLabel!.text = "\(exercise)"

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "unwindFromSelectExercise", sender: self)
    }

}
