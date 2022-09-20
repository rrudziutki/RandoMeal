//
//  DetailViewController.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 22/08/2022.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var mealLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    private let vm = DetailViewViewModel()
    var shouldHideButtons = false
    let mealBuilder = MealBuilder()
    var meal: RealmMeal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        vm.saveToRealm(meal)
        self.saveButton.isEnabled = false
        self.deleteButton.isEnabled = true
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        vm.deleteFromRealm(meal)
        self.deleteButton.isEnabled = false
    }
}

private extension DetailViewController {
    func configure() {
        configureImage()
        mealLabel.text = meal.name
        descriptionTextView.text = meal.instructions
        saveButton.isHidden = shouldHideButtons
        if saveButton.isHidden {
            deleteButton.isEnabled = true
        }
    }
    
    func configureImage() {
        mealImage.image = UIImage(data: meal.imageData)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}
