//
//  NetworkManager.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 09/10/22.
//

import UIKit
//resolver essas mensagens de erro mal-feitas
class PosterFetcher {
    static let shared = PosterFetcher()
    
    let baseURL = "https://image.tmdb.org/t/p/w185/"
    let errorImage:UIImage = UIImage(named: "DBSSHPoster")!
    
    private init() {
        
    }
    
    func getMoviePoster(from urlString: String, completed: @escaping(UIImage) -> Void){
        
        let request = baseURL + urlString
        
        guard let url = URL(string: request) else {
            completed(errorImage)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error  {
                completed(self.errorImage)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(self.errorImage)
                return
            }
            
            guard let data = data else {
                completed(self.errorImage)
                return
            }
            
            guard let image = UIImage(data: data) else {
                completed(self.errorImage)
                return
            }
            
            DispatchQueue.main.async {
                completed(image)
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






