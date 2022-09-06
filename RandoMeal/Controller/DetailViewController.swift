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
    let realm = try! Realm()
    let mealBuilder = MealBuilder()
    var meal: Meal!
    var imageData: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let realmmeal = mealBuilder
            .copyFrom(meal)
            .setImageData(imageData)
            .build()
        // Prepare to handle exceptions.
        do {
            // Open a thread-safe transaction.
            try realm.write {
                realm.add(realmmeal)
            }
        } catch let error as NSError {
            print("An error occurred while saving to realm: \(error)")
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
        mealImage.image = UIImage(data: imageData)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}
