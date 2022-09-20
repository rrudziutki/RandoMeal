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
    @IBOutlet var barButton: UIBarButtonItem!
    @IBOutlet var mealLabel: UILabel!
    @IBOutlet var mealImage: UIImageView!
    private var vm = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgiureVC()
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        vm.getMeal()
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.detailSequeIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == K.detailSequeIdentifier {
            guard let vc = segue.destination as? DetailViewController else { return }
            vc.meal = vm.mealBuilder
                .copyFrom(vm.meal!)
                .setImageData(vm.mealImageData)
                .build()
            vm.mealBuilder = MealBuilder()
        } else {
            guard let _ = segue.destination as? SavedCollectionViewController else { return }
            //TODO CONFIGURATION
        }
    }
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.savedSequeIdentifier, sender: self)
    }
}

//MARK: - Private Extension
private extension ViewController {
    func confgiureVC() {
        vm.delegate = self
    }
}

//MARK: - Meal Delegate
extension ViewController: MealDelegate {
    func configureImage(with data: Data) {
        mealImage.image = UIImage(data: data)
        mealImage.layer.borderWidth = 2
        mealImage.layer.cornerRadius = 5
    }
    
    func presentErrorAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "An Error Occurred", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showMealInfo(_ meal: Meal) {
        mealLabel.text = meal.name
    }
    
    func activateDetailButton() {
        self.detailsButton.isEnabled = true
    }
}
