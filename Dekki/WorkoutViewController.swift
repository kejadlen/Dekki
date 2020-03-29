//
//  WorkoutViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    var deck: [Card]!
    var currentIndex: UInt = 0 {
        didSet {
            guard currentIndex < deck.count else {
                performSegue(withIdentifier: "unwindFromWorkout", sender: self)
                return
            }

            workoutDeckVC.currentIndex = currentIndex
        }
    }

    var workoutDeckVC: WorkoutDeckViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        workoutDeckVC.deck = deck
        workoutDeckVC.currentIndex = currentIndex
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case _ as WorkoutStatusViewController:
            return
        case let vc as WorkoutDeckViewController:
            workoutDeckVC = vc
            workoutDeckVC.delegate = self
        default:
            return
        }
    }
    
}

extension WorkoutViewController: WorkoutDeckViewControllerDelegate {

    func progressToNextCard(from vc: WorkoutDeckViewController) {
        currentIndex += 1
    }

}
