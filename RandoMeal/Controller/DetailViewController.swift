//
//  DetailViewController.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 22/08/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var dishLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    
}
