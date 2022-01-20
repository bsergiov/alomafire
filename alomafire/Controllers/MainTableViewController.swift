//
//  MainTableViewController.swift
//  alomafire
//
//  Created by BSergio on 19.01.2022.
//

import UIKit

class MainTableViewController: UITableViewController {


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Signs.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: Signs.allCases[indexPath.row].rawValue)
        content.text = Signs.allCases[indexPath.row].rawValue
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DescriptionViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        vc.sign = Signs.allCases[indexPath.row].rawValue
    }


}
