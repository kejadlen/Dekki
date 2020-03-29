//
//  WorkoutDeckViewController.swift
//  Dekki
//
//  Created by Alpha on 3/29/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

protocol WorkoutDeckViewControllerDelegate: class {
    func progressToNextCard(from vc: WorkoutDeckViewController)
}

class WorkoutDeckViewController: UITableViewController {

    weak var delegate: WorkoutDeckViewControllerDelegate?

    var deck: [Card]!
    var currentIndex: UInt! {
        didSet {
            tableView.reloadData()
            tableView.scrollToRow(at: [0, Int(currentIndex)], at: .middle, animated: true)
        }
    }

    @IBOutlet weak var exerciseLabel: UILabel!

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        delegate?.progressToNextCard(from: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = (indexPath.row == currentIndex) ? "currentCell" : "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        let card = deck[indexPath.row]
        cell.textLabel!.text = String.localizedStringWithFormat(
            NSLocalizedString("%d \(card.exercise) reps", comment: ""),
            card.reps
        )

        return cell
    }

}
