//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by Мой Господин on 03/04/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation
import Alamofire

class HomeWorldApi{
    func getHomeworld(url: String, completion: @escaping HomeworldResponseCompletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil)}
            let jesonDecoder = JSONDecoder()
            do{
                let homeworld = try jesonDecoder.decode(homeWorld.self, from: data)
                completion(homeworld)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
