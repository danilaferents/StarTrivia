//
//  FilmApi.swift
//  StarTrivia
//
//  Created by Мой Господин on 04/04/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation
import Alamofire

class FilmsApi {
    func getFilm(url: String, completion: @escaping FilmResponseCompletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            
            do{
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}
