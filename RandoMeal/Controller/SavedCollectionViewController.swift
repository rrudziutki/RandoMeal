//
//  SavedCollectionViewController.swift
//  RandoMeal
//
//  Created by RMakuchowski on 07/09/2022.
//

import UIKit
import RealmSwift

class SavedCollectionViewController: UICollectionViewController {
    private let vm = SavedCollectionViewViewModel()
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vm.getMeals()
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(vm.allMeals.count)
        return vm.allMeals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentMeal = vm.allMeals[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.nibMealCellIdentifier, for: indexPath) as! MealCollectionViewCell
        cell.imageView.image = UIImage(data: currentMeal.imageData)
        cell.nameLabel.text = currentMeal.name
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.6
        cell.layer.masksToBounds = false
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.selectedMeal = vm.allMeals[indexPath.row]
        performSegue(withIdentifier: K.savedToDetailSequeIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailViewController else { return }
        vc.meal = vm.selectedMeal
        vc.shouldHideButtons = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            guard let self = self else { fatalError() }
            self.vm.selectedMeal = self.vm.allMeals[indexPath.row]
        
            let details = UIAction(title: "See details",
                                image: UIImage(systemName: "magnifyingglass"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                self.performSegue(withIdentifier: K.savedToDetailSequeIdentifier, sender: self)
            }
            
            let delete = UIAction(title: "Delete",
                                  image: UIImage(systemName: "trash"),
                                  identifier: nil,
                                  discoverabilityTitle: nil,
                                  attributes: .destructive,
                                  state: .off) { _ in
                try! self.realm.write {
                    self.realm.delete(self.vm.selectedMeal)
                }
                collectionView.reloadData()
            }
            
            return UIMenu(title: "",
                          image: nil,
                          identifier: nil,
                          options: UIMenu.Options.displayInline,
                          children: [details, delete])
        }
        return config
    }
}

// MARK: - Private Extension
private extension SavedCollectionViewController {
    func configure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: K.nibMealCellIdentifier)
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension SavedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 30.0
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
