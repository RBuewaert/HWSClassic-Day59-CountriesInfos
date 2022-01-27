//
//  DetailTableViewController.swift
//  Project15M
//
//  Created by Romain Buewaert on 27/10/2021.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var country: Country?
    var propertyList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentCountry = country else { return }
        print("current country = \(currentCountry)")
        propertyList.append("Capital city: \(currentCountry.capitalCity)")
        propertyList.append("Language: \(currentCountry.language)")
        propertyList.append("Area: \(currentCountry.area)")
        propertyList.append("Water area: \(currentCountry.waterArea)")
        propertyList.append("Population: \(currentCountry.population)")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") else { return UITableViewCell() }

        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = propertyList[indexPath.row]
        cell.contentConfiguration = contentConfig
        return cell
    }
}
