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
    
    //    @IBOutlet weak var stackBg: UIView!
    var personApi = PersonApi()
    override func viewDidLoad() {
        super.viewDidLoad()
//        stackBg.layer.cornerRadius = 10
        
        personApi.getRandomPersonUrlSession()
    }


}

