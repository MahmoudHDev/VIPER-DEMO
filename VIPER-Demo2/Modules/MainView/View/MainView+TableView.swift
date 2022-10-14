//
//  MainView+TableView.swift
//  VIPER-Demo2
//
//  Created by Mahmoud on 10/14/22.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersToView?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = usersToView?[indexPath.row].name ?? "No Name"
        return cell
    }
}
