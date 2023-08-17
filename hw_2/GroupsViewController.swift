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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        networkService.getGroups()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        GroupsCell()
    }

    
}
