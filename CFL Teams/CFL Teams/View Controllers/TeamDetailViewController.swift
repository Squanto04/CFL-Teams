//
//  TeamDetailViewController.swift
//  CFL Teams
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    var receiver: Teams?
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var divisionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let teams = receiver else { return }
        CFLController.getImage(for: teams) { (image) in
            DispatchQueue.main.async {
             self.teamLogoImageView.image = image
            }
        }
        self.title = teams.fullname
        DispatchQueue.main.async {
            self.nicknameLabel.text = teams.nickname
            self.abbreviationLabel.text = teams.abbreviation
            self.venueLabel.text = teams.venuename
            self.divisionLabel.text = teams.divisionname
        }
    }

}
