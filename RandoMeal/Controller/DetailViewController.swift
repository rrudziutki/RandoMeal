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
    private let realm = try! Realm()
    let mealBuilder = MealBuilder()
    var meal: RealmMeal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        do {
            try realm.write {
                realm.add(meal)
                self.saveButton.isEnabled = false
                self.deleteButton.isEnabled = true
                //TODO FIX RE-ADDING BUG
            }
        } catch let error as NSError {
            print("An error occurred while saving to realm: \(error)")
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        try! realm.write {
            realm.delete(meal)
            self.deleteButton.isEnabled = false
        }
    }
}

private extension DetailViewController {
    func configure() {
        configureImage()
        mealLabel.text = meal.name
        descriptionTextView.text = meal.instructions
    }
    
    func configureImage() {
        mealImage.image = UIImage(data: meal.imageData)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}
