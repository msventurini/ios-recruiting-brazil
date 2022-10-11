//
//  NetworkManager.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 09/10/22.
//

import Foundation
//resolver essas mensagens de erro mal-feitas
class MoviesFetcher {
    static let shared = MoviesFetcher()
    
    let baseURL = "https://api.themoviedb.org/3/movie/popular"
    
    private init() {
        
    }
    
    func getPopularMovies(for key: String, page: Int, completed: @escaping(Result<[Movie], ServiceError>) -> Void){
        
        let request = baseURL + "?api_key=\(key)&language=en-US&page=\(page)"
        
        guard let url = URL(string: request) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error  {
                completed(.failure(.invalidURL))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidURL))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidURL))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let resp =  try decoder.decode(Response.self, from: data)
                completed(.success(resp.results))
            }catch{
                completed(.failure(.invalidURL))
                return
            }
            
            
            
        }
        
        task.resume()
        
        

        
    }
    
    
    /* refazer async await depois*/
//    func fetchPopularMovies(key: String) async throws -> [Movie] {
//
//        var urlPath: String = "https://api.themoviedb.org/3/movie/popular?api_key=\(key)&language=en-US&page=1"
//
//        guard let url = URL(string: urlPath) else { throw ServiceError.invalidURL }
//
//        let (data, _) = try await URLSession.shared.data(from: url)
//
//        let resp = try JSONDecoder().decode(Response.self, from: data)
//
//        return resp.results
//
//    }
//
}






