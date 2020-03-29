//
//  WorkoutDeckViewController.swift
//  Dekki
//
//  Created by Alpha on 3/29/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import AVFoundation
import UIKit

class WorkoutDeckViewController: UITableViewController {

    let speechSynthesizer = AVSpeechSynthesizer()

    var deck: [Card]!
    var currentIndex: UInt! {
        didSet {
            tableView.reloadData()

            let utterance = AVSpeechUtterance(string: "\(deck[Int(currentIndex)])")
            speechSynthesizer.speak(utterance)

            tableView.scrollToRow(at: [0, Int(currentIndex)], at: .middle, animated: true)
        }
    }

    @IBOutlet weak var exerciseLabel: UILabel!

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = (indexPath.row == currentIndex) ? "currentCell" : "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        cell.textLabel!.text = "\(deck[indexPath.row])"

        return cell
    }

}
