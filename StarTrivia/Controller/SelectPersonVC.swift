//
//  ViewController.swift
//  StarTrivia
//
//  Created by Мой Господин on 23/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var homeworldBt: UIButton!
    @IBOutlet weak var vehicleBt: UIButton!
    @IBOutlet weak var starshipsBt: UIButton!
    @IBOutlet weak var filmsBt: UIButton!
    
    //    @IBOutlet weak var stackBg: UIView!
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        stackBg.layer.cornerRadius = 10
    }
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonAlarmoCodable(id: random) { (person) in
            if let person = person{
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    func setupView(person: Person){
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        //1 way
//        if person.homeworldUrl.isEmpty {
//            homeworldBt.isEnabled = true
//        } else {
//            homeworldBt.isEnabled = false
//        }
        //2 way
        homeworldBt.isEnabled = !person.homeworldUrl.isEmpty
        vehicleBt.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBt.isEnabled = !person.starshipUrls.isEmpty
        filmsBt.isEnabled = !person.filmUrl.isEmpty
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
        //        enum Segue : String{
        //            case homeworld = "toHomeworld"
        //            case vehicles = "toVehicles"
        //            case starships = "toStarships"
        //            case films = "toFilms"
        //        }
        //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        switch segue.identifier {
        //        case Segue.homeworld.rawValue:
        //            if let destination = segue.destination as? HomeworldVC {
        //                destination.person = person
        //            }
        //        case Segue.vehicles.rawValue:
        //            if let destination = segue.destination as? VehiclesVC {
        //                destination.person = person
        //            }
        //        case Segue.starships.rawValue:
        //            if let destination = segue.destination as? StarshipsVC {
        //                destination.person = person
        //            }
        //        case Segue.films.rawValue:
        //            if let destination = segue.destination as? FilmsVC {
        //                destination.person = person
        //            }
        //        default:
        //            break
        //        }
        //    }
    }
}
protocol PersonProtocol {
    var person: Person! {get set}
}
