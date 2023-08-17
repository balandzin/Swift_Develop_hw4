//
//  NetworkService.swift
//  hw_2
//
//  Created by Антон Баландин on 10.08.23.
//

import Foundation

protocol NetworkServiceDelegate: AnyObject {
    func updateTable(models: [FriendsModel])
}

final class NetworkService {
    
    //weak var delegate: NetworkServiceDelegate?
    
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends(completion: @escaping ([FriendsModel]) -> Void ) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50&access_token=\(NetworkService.token)&v=5.131") else {
            return
        }

        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                 let friends = try JSONDecoder().decode([FriendsModel].self, from: data)
                completion(friends)
                //self.delegate?.updateTable(models: friends)
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroups() {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.131&extended=1") else {
            return
        }

        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                print(groups)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos() {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile") else {
            return
        }

        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
}


