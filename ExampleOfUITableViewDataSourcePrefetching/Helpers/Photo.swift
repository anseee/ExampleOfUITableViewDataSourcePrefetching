//
//  Photo.swift
//  ExampleOfUITableViewDataSourcePrefetching
//
//  Created by 박성원 on 15/08/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import Foundation

struct Photo: Codable {
    var id: String?
    var created_at: String?
    var updated_at: String?
    var width: Int?
    var height: Int?
    var color: String?
    var description: String?
    var alt_description: String?
    var urls: [String:String]?
}
