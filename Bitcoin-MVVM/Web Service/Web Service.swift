//
//  Web Service.swift
//  Bitcoin-MVVM
//
//  Created by Burak Donat on 21.04.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: String, completion: @escaping ([Currency]?) -> Void) {
        if let urlString = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let safeData = data {
                    if let decodedData = try? JSONDecoder().decode([Currency].self, from: safeData) {
                        print(decodedData)
                        completion(decodedData)
                    }
                }
            }
            task.resume()
        }
    }
}
