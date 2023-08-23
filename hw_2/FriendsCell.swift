//
//  CustomTableViewCell().swift
//  hw_2
//
//  Created by Антон Баландин on 8.08.23.
//

import UIKit

final class FriendsCell: UITableViewCell {
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var circle = UIImageView(image: UIImage(systemName: "person"))
    
    
    private var text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    func setupTextFriends(friend: Friend) {
        text.text = (friend.firstName ?? "") + " " + (friend.lastName ?? "")
        if let online = friend.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        
        DispatchQueue.global ().async {
            if let url = URL (string: friend.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.circle.image = UIImage(data: data)
                }
            }
        }
        
    }
    
    func updateCell (model: Friend) {
        text.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        if let online = model.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        DispatchQueue.global ().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data (contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.circle.image = UIImage (data: data)
                }
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector (cellClick))
        addGestureRecognizer(recognizer)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(text)
        circle.addSubview(onlineCircle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            onlineCircle.widthAnchor.constraint(equalToConstant: 20),
            onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
            onlineCircle.bottomAnchor.constraint(equalTo: circle.bottomAnchor),
            onlineCircle.trailingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 10),
            
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
//        override func prepareForReuse() {
//            super.prepareForReuse()
//            text.text = nil
//}
        
        @objc private func cellClick() {
            tap?(text.text, circle.image)
    }
}

