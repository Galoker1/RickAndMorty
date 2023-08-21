//
//  NetworkManager.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import Foundation
import UIKit

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init(){
        
    }
    
    func getAllCharacters(page:String,completion: @escaping ((AllCharacter)->())){
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "rickandmortyapi.com"
        urlComponent.path = "/api/character/"
        urlComponent.queryItems = [
            URLQueryItem(name: "page", value: page)
        ]
        guard let url = urlComponent.url else {return}
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, responce, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "Error")
                return
            }
            if let responceData = data{
                do{
                    let responce = try JSONDecoder().decode(AllCharacter.self, from: responceData)
                    completion(responce)

                    
                }

                catch let err{
                    print(err.localizedDescription)
                    return
                }
            }
            
        }.resume()
    }
    func getOriginInfo(url:URL,completion: @escaping ((Planet)->())){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, responce, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "Error")
                return
            }
            if let responceData = data{
                do{
                    let responce = try JSONDecoder().decode(Planet.self, from: responceData)
                    completion(responce)

                    
                }

                catch let err{
                    print(err.localizedDescription)
                    return
                }
            }
            
        }.resume()
    }
    
    func getEpisodeInfo(url:URL,completion: @escaping ((Episode)->())){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, responce, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "Error")
                return
            }
            if let responceData = data{
                do{
                    let responce = try JSONDecoder().decode(Episode.self, from: responceData)
                    completion(responce)

                    
                }

                catch let err{
                    print(err.localizedDescription)
                    return
                }
            }
            
        }.resume()
    }
    func getImage(url:String,completion: @escaping ((UIImage)->())){
        if let imageUrl = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    print("Ошибка: \(error)")
                    return
                }
                if let imageData = data {
                    if let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            completion(image)
                        }
                    } else {
                        print("Не удалось создать изображение из данных")
                    }
                }
            }
            task.resume()
        }
    }
}
