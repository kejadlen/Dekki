//
//  WorkoutViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    let deck = Deck()
    var exercises: [Suit: String]!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deal()
    }
    
    @IBAction func didTap(_ sender: Any) {
        deal()
    }
    
    private func deal() {
        guard let card = deck.deal() else {
            performSegue(withIdentifier: "unwindFromWorkout", sender: self)
            return
        }
        
        label.text = "\(card.rank.rawValue) \(exercises[card.suit]!)"
    }
    
}
