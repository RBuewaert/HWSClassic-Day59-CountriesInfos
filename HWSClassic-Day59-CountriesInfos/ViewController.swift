//
//  ViewController.swift
//  Project15M
//
//  Created by Romain Buewaert on 27/10/2021.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fileToLoad = Bundle.main.url(forResource: "Countries", withExtension: "json") {
            if let data = try? Data(contentsOf: fileToLoad) {
                print(data)
                if let jsonDecodable = try? JSONDecoder().decode(Countries.self, from: data) {
                    print(jsonDecodable)
                    countries = jsonDecodable.countries
                    countries = countries.sorted { $0.name < $1.name }
                    tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Country") else { return UITableViewCell() }

        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = countries[indexPath.row].name.uppercased()
        cell.contentConfiguration = contentConfig
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailTableViewController else { return }
        vc.country = countries[indexPath.row]
        vc.title = countries[indexPath.row].name.uppercased()
        navigationController?.pushViewController(vc, animated: true)
    }
}

