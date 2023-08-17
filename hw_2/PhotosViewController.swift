//
//  NewViewController.swift
//  hw_2
//
//  Created by Антон Баландин on 8.08.23.
//

import UIKit
import Foundation


class PhotosViewController: UICollectionViewController {
    private var networkService = NetworkService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Photos"
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier:
        Constants.Identifier.photoCellIdentifier)
        networkService.getPhotos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView:
        UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier:
            Constants.Identifier.photoCellIdentifier, for:
            indexPath) as! PhotoCell
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout
    {
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
        }
    }

