//
//  Service.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 28/09/22.
//

import Foundation

struct Response: Decodable {
    let page: Int
}

enum ServiceError: Error {
    case invalidURL
    case network(Error?)
    case decodeFail(Error)
}

//do{
//    let service = Service()
//    service.get(page: 1) { result in
//        DispatchQueue.main.async {
//            switch result {
//            case let .failure(error):
//                print(error)
//            case let .success(data):
//                print(data)
//            }
//        }
//    }
//}

class Service {
    
    private let baseURL = "https://api.themoviedb.org/3/"
    
    func get(page: Int, callback: @escaping (Result<Any, ServiceError>) -> Void) {
        let path = "movie/popular?api_key=&language=en-US&page=\(page)"
        guard let url = URL(string: baseURL + path) else {
            callback(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            
            do{
                let response = try JSONDecoder().decode(Response.self, from: data)
                callback(.success(response))
            } catch {
                callback(.failure(.decodeFail(error)))

            }
                        
        }
        task.resume()
    }
    
}


