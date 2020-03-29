//
//  ViewController.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class SetupDeckViewController: UITableViewController {

    let deckBuilder = DeckBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? WorkoutViewController else { return }
        
        vc.deck = deckBuilder.build()
    }

    @IBAction func unwindFromWorkout(segue: UIStoryboardSegue) {
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deckBuilder.exerciseDefinitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseDefinitionCell", for: indexPath)

        let exerciseDefinition = deckBuilder.exerciseDefinitions[indexPath.row]
        cell.textLabel!.text = NSLocalizedString("\(exerciseDefinition)", comment: "")

        return cell
    }
    
}
