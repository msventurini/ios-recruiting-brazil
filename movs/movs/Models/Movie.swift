//
//  Movie.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 07/10/22.
//

import UIKit

struct Movie: Decodable, Hashable {
    var poster_path: String
    var overview: String
    var release_date: String
    var id: Int
    var title: String
    //var popularity: Int
}
