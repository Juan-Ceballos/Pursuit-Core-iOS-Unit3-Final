//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {
    
    @IBOutlet weak var elementTableView: UITableView!
        
    var elements = [Element]()  {
        didSet  {
            DispatchQueue.main.async {
                self.elementTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementTableView.dataSource = self
        elementTableView.delegate = self
        loadData()
    }
    
    func loadData() {
        ElementAPIClient.fetchElements { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let element):
                self.elements = element
            }
        }
    }
    
}

extension ElementViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = elementTableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell
            else    {
                fatalError()
        }
        
        let element = elements[indexPath.row]
        cell.configureCell(urlString: "", element: element)
        
        return cell
    }
}

extension ElementViewController: UITableViewDelegate    {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

