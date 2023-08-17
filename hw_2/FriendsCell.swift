//
//  CustomTableViewCell().swift
//  hw_2
//
//  Created by Антон Баландин on 8.08.23.
//

import UIKit

final class FriendsCell: UITableViewCell {
    
    private var circle: UIImageView = {
        let circle = UIImageView()
        circle.backgroundColor = .green
        circle.layer.cornerRadius = 25
        return circle
    }()
    
    private var text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    func setupTextFriends(friend: Friend) {
        text.text = friend.firstName ?? ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(text)
        setupConstraints()
    }
    
    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        text.text = nil
    }
}

