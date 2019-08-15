//
//  ApiManager.swift
//  ExampleOfUITableViewDataSourcePrefetching
//
//  Created by 박성원 on 15/08/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
 
    let client_id = "sign up and use user client_id"
    let host = "https://api.unsplash.com/"
    let path = "/photos/?"
    let per_page = "10"
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    
    override init() {
        
    }
    
    func loadData(page: Int = 1, completed: @escaping ([Photo]?) -> Void) {
        if var urlComponents = URLComponents(string: "\(host)\(path)") {
            // params
            urlComponents.query = "page=\(page)&per_page=\(per_page)&client_id=\(client_id)"

            guard let url = urlComponents.url else { return }

            dataTask = defaultSession.dataTask(with: url, completionHandler: { data, response, error in
                do { self.dataTask = nil }
                
                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    let photos: [Photo] = try! JSONDecoder().decode([Photo].self, from: data)
                    completed(photos)
                }
                
            })
        }
        else {
            completed(nil)
        }
        
        dataTask?.resume()
    }
}
