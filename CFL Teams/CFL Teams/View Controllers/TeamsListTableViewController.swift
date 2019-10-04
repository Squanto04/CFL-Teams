//
//  TeamsListTableViewController.swift
//  CFL Teams
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class TeamsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CFLController.fetchTeams {
            self.reloadTableView()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CFLController.teamsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
        let team = CFLController.teamsArray[indexPath.row]
        cell.textLabel?.text = team.fullname
        cell.detailTextLabel?.text = team.abbreviation
        return cell
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? TeamDetailViewController else { return }
            let objectToSend = CFLController.teamsArray[indexPath.row]
            destinationVC.receiver = objectToSend
        }
    }
} // End of Class
