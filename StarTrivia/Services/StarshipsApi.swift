//
//  StarshipsApi.swift
//  StarTrivia
//
//  Created by Мой Господин on 04/04/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    func getStarships(url: String, completion: @escaping StarshipResponseCompletion) {
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
                let starship = try jsonDecoder.decode(StarShip.self, from: data)
                completion(starship)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
