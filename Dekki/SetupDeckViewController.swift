//
//  ViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SetupDeckViewController: UITableViewController {

    var exerciseDefinitions = Exercise.allCases.map { ExerciseDefinition(exercise: $0) }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let nav as UINavigationController:
            switch nav.topViewController {
            case let vc as WorkoutViewController:
                vc.deck = makeDeck()
            case let vc as SetupExerciseViewController:
                guard let indexPath = tableView.indexPathForSelectedRow else { return }

                vc.exerciseDefinition = exerciseDefinitions[indexPath.row]
            default:
                return
            }
        default:
            return
        }        
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseDefinitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseDefinitionCell", for: indexPath)

        let exerciseDefinition = exerciseDefinitions[indexPath.row]
        cell.textLabel!.text = "\(exerciseDefinition.exercise)"

        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "setupExercise", sender: self)
    }

    // MARK: - IBActions

    @IBAction func unwindFromWorkout(segue: UIStoryboardSegue) {}
    @IBAction func cancelFromSetupExercise(segue: UIStoryboardSegue) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func doneFromSetupExercise(segue: UIStoryboardSegue) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        let vc = segue.source as! SetupExerciseViewController
        exerciseDefinitions[indexPath.row] = vc.exerciseDefinition
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Private

    private func makeDeck() -> [Card] {
        return exerciseDefinitions.flatMap { exerciseDef in
            return (1..<14).map { rank in
                guard rank != 1 else {
                    var reps: UInt
                    switch exerciseDef.aceRepetitions {
                    case .one: reps = 1
                    case .rank: reps = 14
                    }
                    return Card(reps: reps, exercise: exerciseDef.exercise)
                }

                return Card(reps: UInt(rank), exercise: exerciseDef.exercise)
            }
        }.shuffled()
    }

}
