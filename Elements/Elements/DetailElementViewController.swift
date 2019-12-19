//
//  DetailElementViewController.swift
//  Elements
//
//  Created by Juan Ceballos on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailElementViewController: UIViewController {

    @IBOutlet weak var elementImageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var meltingPointLabel: UILabel!
    @IBOutlet weak var boilingPointLabel: UILabel!
    @IBOutlet weak var dicoveredByLabel: UILabel!

    var element: Element?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let theElement = element
            else    {
                return
        }
        title = theElement.name
        elementImageLabel.getImage(with: "http://images-of-elements.com/\(theElement.name.lowercased() ).jpg") { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let elementImage):
                DispatchQueue.main.async {
                    self.elementImageLabel.image = elementImage
                }
            }
        }
        nameLabel.text = theElement.name
        symbolLabel.text = theElement.symbol
        numberLabel.text = theElement.number.description
        weightLabel.text = theElement.atomicMass.description
        
    }
    
}
