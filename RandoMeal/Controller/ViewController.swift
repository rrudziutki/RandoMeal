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
    private var vm = MealViewModel(mealService: MealService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgiureVC()
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        vm.getMeal()
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.sequeIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailViewController else { return }
        vc.meal = vm.meal
    }
}

//MARK: - Private Extension
private extension ViewController {
    func confgiureVC() {
        vm.delegate = self
    }
    
    func configureImage() {
        mealImage.loadFrom(from: vm.meal?.imageURL ?? "")
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
}

//MARK: - Meal Delegate
extension ViewController: MealDelegate {
    func showMealInfo(_ meal: Meal) {
        mealLabel.text = meal.name
        configureImage()
    }
    
    func activateDetailButton() {
        self.detailsButton.isEnabled = true
    }
}
