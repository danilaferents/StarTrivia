//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Мой Господин on 24/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation

class PersonApi{
    func getRandomPersonUrlSession() {
        
        guard let url = URL(string: PERSON_URL) else {return }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {return}
                let person = self.parsePersonManual(json: json)
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    private func parsePersonManual(json: [String: Any])-> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person.init(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrl: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        return person
    }
}
