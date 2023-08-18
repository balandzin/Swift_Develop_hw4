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
    private var models: [Photo] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Photos"
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCellIdentifier)
        networkService.getPhotos { [weak self] photos in
            self?.models = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    override func collectionView(_ collectionView:
        UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier:
            Constants.Identifier.photoCellIdentifier, for:
                                    indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
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

