//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Мой Господин on 31/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let api = StarshipApi()
    var starShips =  [String]()
    var currentStarship = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var passengerLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    
    @IBOutlet weak var previousBtn: FadeENabledBt!
    @IBOutlet weak var nextBtn: FadeENabledBt!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starShips = person.starshipUrls
        setBtState()
        nextBtn.isEnabled = starShips.count > 1
        guard let firstStarship = starShips.first else {
            return
        }
        getStarShip(url: firstStarship)
    }
    func getStarShip(url: String) {
        spinner.startAnimating()
        api.getStarships(url: url) { (starship) in
            self.spinner.stopAnimating()
            if let starship = starship {
                self.SetupView(starship: starship)
            }
        }
    }
    
    func SetupView(starship: StarShip) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost_in_credits
        lengthLbl.text = starship.length
        speedLbl.text = starship.max_atmosphering_speed
        passengerLbl.text = starship.passengers
        classLbl.text = starship.starship_class
    }
    
    func setBtState() {
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        nextBtn.isEnabled = currentStarship == starShips.count - 1 ? false : true
    }
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setBtState()
        getStarShip(url: starShips[currentStarship])
        
    }
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setBtState()
        getStarShip(url: starShips[currentStarship])
    }
}
