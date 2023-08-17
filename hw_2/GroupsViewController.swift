//
//  ViewController2.swift
//  hw_2
//
//  Created by Антон Баландин on 8.08.23.
//

import Foundation
import UIKit

class GroupsViewController: UITableViewController {
    
    private var networkService = NetworkService()
    private var models: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        
        tableView.register(GroupsCell.self, forCellReuseIdentifier: "GroupsCell")
        
        networkService.getGroups() { [ weak self ] groups in
            self?.models = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath)
        let model = models[indexPath.row]
        guard let cell = cell as? GroupsCell else {
            return UITableViewCell()
        }
        
        cell.setupTextGroups(group: model)
        return cell
    }
    
}

