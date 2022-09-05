//
//  DetailViewController.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 22/08/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var mealLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var saveButton: UIButton!
    var meal: Meal!
    var imageData: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        //TODO save to realm
    }
}

private extension DetailViewController {
    func configure() {
        configureImage()
        mealLabel.text = meal.name
        descriptionTextView.text = meal.instructions
    }
    
    func configureImage() {
        mealImage.image = UIImage(data: imageData)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}
