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
    private var models: [Friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem=UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: "FriendsCell")

        networkService.getFriends() { [ weak self ] friends in
            self?.models = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear (animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.reloadData()
    }
    
         
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            return UITableViewCell()
        }
        
        let model = models[indexPath.row]
        
        cell.updateCell(model: model)
        cell.tap = { [weak self] text, photo in
            self?.navigationController?
                .pushViewController(ProfileViewController(name: text, photo: photo, isUserProfile: false), animated: true)
        }
        return cell
    }
}


private extension FriendsViewController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction (name: .easeOut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?
            .pushViewController (ProfileViewController(isUserProfile: true), animated: false)
    }
}
