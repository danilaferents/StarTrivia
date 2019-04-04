//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Мой Господин on 31/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let api = FilmsApi()
    var films = [String]()
    var currentFilm = 0
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedlbl: UILabel!
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var crawlLbl: UITextView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrl
        setBtState()
        nextBtn.isEnabled = films.count - 1 > 1
        guard let firstFilm = films.first else {return}
        getFilm(url: firstFilm)
    }
    
    func getFilm(url: String) {
        spinner.startAnimating()
        api.getFilm(url: url) { (film) in
            self.spinner.stopAnimating()
            if let film = film {
                self.setipView(film: film)
            }
        }
    }
    
    func setipView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode_id)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedlbl.text = film.release_date
        let stripped = film.opening_crawl.replacingOccurrences(of: "\n", with: "")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setBtState()
        getFilm(url: films[currentFilm])
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setBtState()
        getFilm(url: films[currentFilm])
    }
    
    func setBtState() {
        nextBtn.isEnabled =  currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
    }
    
}
