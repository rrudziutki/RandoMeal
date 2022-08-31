//
//  UIIMageView.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import UIKit
import Alamofire

extension UIImageView {
    
    func loadFrom(from url: String) {
        guard let url = URL(string: url) else {
            return
        }
        self.image = nil
        DispatchQueue.main.async { [weak self] in
            AF.request(url)
                .validate()
                .response { response in
                    guard let imageData = response.value else { return }
                    guard let image = UIImage(data: imageData!) else { return }
                    self?.image = image
                }
        }
    }
}
