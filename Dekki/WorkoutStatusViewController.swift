//
//  WorkoutStatusViewController.swift
//  Dekki
//
//  Created by Alpha on 3/29/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import UIKit

class WorkoutStatusViewController: UIViewController {

    let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    var startedAt: Date!

    @IBOutlet weak var durationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        durationLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 32, weight: .regular)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        startedAt = Date.init()

        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            let duration = Date().timeIntervalSince(self.startedAt)
            let ms = Int((duration.truncatingRemainder(dividingBy: 1)) * 100)
            self.durationLabel.text = "\(self.durationFormatter.string(from: duration)!).\(String(format: "%02d", ms))"
        }
    }

}
