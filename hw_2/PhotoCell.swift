//
//  PhotoCell.swift
//  hw_2
//
//  Created by Антон Баландин on 11.08.23.
//


import UIKit

final class PhotoCell: UICollectionViewCell {

    private let photoView = UIImageView(image: UIImage (systemName: "person" ))
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        setupViews ()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
        
    }
    
    private func setupViews () {
        addSubview (photoView)
        setupConstraints ()
    }
    
    private func setupConstraints() {
        photoView.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.topAnchor.constraint (equalTo: topAnchor),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse ()
        photoView.image = nil
    }
}
