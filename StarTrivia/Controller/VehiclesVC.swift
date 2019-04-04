//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Мой Господин on 31/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    
    var person: Person!
    let api = VehiclesApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costincreditsLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var maxspeedLbl: UILabel!
    
    @IBOutlet weak var previousBt: UIButton!
    @IBOutlet weak var nextBt: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBt.isEnabled = vehicles.count > 1
        setBtState()
        guard let firstVehicles = vehicles.first else {return}
        getVehicle(url: firstVehicles)
    }
    
    func getVehicle(url: String) {
        spinner.startAnimating()
        api.getVehicles(url: url) { (vehicle) in
            self.spinner.stopAnimating()
            if let vehicle = vehicle{
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func    setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costincreditsLbl.text = vehicle.cost_in_credits
        lengthLbl.text = vehicle.length
        maxspeedLbl.text = vehicle.max_atmosphering_speed
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setBtState()
        getVehicle(url: vehicles[currentVehicle])
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setBtState()
        getVehicle(url: vehicles[currentVehicle])
    }
    
    func setBtState() {
        previousBt.isEnabled = currentVehicle == 0 ? false : true
        nextBt.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
//        if currentVehicle == 0 {
//            previousBt.isEnabled = false
//        } else {
//            previousBt.isEnabled = true
//        }
//        if currentVehicle == vehicles.count - 1 {
//            nextBt.isEnabled = false
//        } else {
//            nextBt.isEnabled = true
//        }
        
    }
    
    
}
