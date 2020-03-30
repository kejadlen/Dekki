//
//  ViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SetupDeckViewController: UITableViewController {

    var exerciseConfigs = Exercise.allCases.map { ExerciseConfig(exercise: $0) }

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

                vc.exerciseConfig = exerciseConfigs[indexPath.row]
            default:
                return
            }
        default:
            return
        }        
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseConfigs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseConfigCell", for: indexPath)

        let exerciseConfig = exerciseConfigs[indexPath.row]
        cell.textLabel!.text = "\(exerciseConfig.exercise)"

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
        exerciseConfigs[indexPath.row] = vc.exerciseConfig
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Private

    private func makeDeck() -> [Card] {
        return exerciseConfigs.flatMap { exerciseConfig in
            return (1..<14).map { rank in
                switch rank {
                case 1:
                    return Card(reps: exerciseConfig.aceReps, exercise: exerciseConfig.exercise)
                case 2..<11:
                    return Card(reps: UInt(rank), exercise: exerciseConfig.exercise)
                case 11..<14:
                    return Card(reps: exerciseConfig.faceReps(for: UInt(rank)), exercise: exerciseConfig.exercise)
                default:
                    fatalError()
                }
            }
        }.filter { card in
            card.reps > 0
        }.shuffled()
    }

}
