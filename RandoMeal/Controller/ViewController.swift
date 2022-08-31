//
//  ViewController.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 22/08/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var drawButton: UIButton!
    @IBOutlet var detailsButton: UIButton!
    @IBOutlet var mealLabel: UILabel!
    @IBOutlet var mealImage: UIImageView!
        private var meal: Meal!
    private var vm = MealViewModel(mealService: MealService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgiureVC()
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        vm.getMealDescription()
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
    }
}

private extension ViewController {
    func confgiureVC() {
        vm.delegate = self
    }
    
    func configureImage() {
        mealImage.loadFrom(from: meal.imageURL)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}

extension ViewController: MealDelegate {
    func showMealInfo(_ meal: Meal) {
        self.meal = meal
        mealLabel.text = meal.name
        configureImage()
    }
    
    
}
