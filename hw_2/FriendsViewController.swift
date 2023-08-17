//
//  ViewController1.swift
//  hw_2
//
//  Created by Антон Баландин on 8.08.23.
//

import Foundation
import UIKit

class FriendsViewController: UITableViewController {
    
    private var networkService = NetworkService()
    private var models: [FriendsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: "FriendsCell")
        //networkService.delegate = self
        
        networkService.getFriends() { [ weak self ] friends in
            self?.models = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //FriendsCell()
    


        let cell = tableView.dequeueReusableCell(withIdentifier:
        "FriendsCell", for: indexPath)

        let model = models[indexPath.row]

        guard let cell = cell as? FriendsCell else {
        return UITableViewCell()
        }

        cell.setupTextFriends(friend: model)
        return cell
        
        
    }
}

extension FriendsViewController: NetworkServiceDelegate {
    func updateTable(models: [FriendsModel]) {
        self.models = models
        DispatchQueue.main.async {
            self.tableView.reloadData ()
        }
    }
}
