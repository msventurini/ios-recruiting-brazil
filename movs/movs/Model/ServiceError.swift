//
//  ServiceError.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 07/10/22.
//

import UIKit

enum ServiceError: Error {
    case invalidURL
    case network(Error?)
    case decodeFail(Error)
}
