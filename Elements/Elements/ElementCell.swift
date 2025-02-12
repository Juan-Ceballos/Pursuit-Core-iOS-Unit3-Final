//
//  ElementCell.swift
//  Elements
//
//  Created by Juan Ceballos on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    func configureCell(urlString: String, element: Element) {
        
        elementImage.getImage(with: urlString) { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let elementImage):
                DispatchQueue.main.async {
                    self?.elementImage.image = elementImage
                }
            }
        }
        nameLabel.text = element.name
        symbolLabel.text = "\(element.symbol)(\(element.number)) \(element.atomicMass.description)"
    }
}
