//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Мой Господин on 31/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    var person: Person!
    let api = HomeWorldApi()
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        api.getHomeworld(url: person.homeworldUrl) { (homeWorld) in
            self.spinner.stopAnimating()
            if let homeworld = homeWorld{
                self.setupUi(homeWorld: homeworld)
            }
        }
        // Do any additional setup after loading the view.
    }
    func setupUi(homeWorld: homeWorld){
        nameLbl.text = homeWorld.name
        climateLbl.text = homeWorld.climate
        terrainLbl.text = homeWorld.terrain
        populationLbl.text = homeWorld.population
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
