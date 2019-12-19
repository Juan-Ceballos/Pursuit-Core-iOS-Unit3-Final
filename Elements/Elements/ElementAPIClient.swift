//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Juan Ceballos on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class ElementAPIClient  {
    
    static func fetchElements(completion: @escaping (Result<[Element], AppError>) -> ()) {
        let endpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: endpointURL)
            else    {
                completion(.failure(.badURL(endpointURL)))
                return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result   {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do  {
                    let element = try JSONDecoder().decode([Element].self, from: data)
                    completion(.success(element))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func postFavoriteElement()   {
        
    }
    
}
