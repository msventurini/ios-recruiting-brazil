//
//  Response.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 07/10/22.
//

import UIKit

struct Response: Decodable, Hashable {
    var page: Int
    var results = [Movie]()
    var total_pages: Int
}
