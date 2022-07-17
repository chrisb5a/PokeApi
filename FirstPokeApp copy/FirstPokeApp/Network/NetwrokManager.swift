//
//  NetwrokManager.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//


import Foundation

class NetworkManager {
    
    
    
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
//            guard let response = (response as? HTTPURLResponse)?.allHeaderFields["picsum-id"] else {
//                completion(.failure(NetworkError.badData))
//                return
//            }
            let response = "\(String(describing: (response as?HTTPURLResponse)?.allHeaderFields["picsum-id"]))"
            completion(.success(data))
            
            print(response)
            
            print("\(String(describing: URLRequest(url:URL(string: "https://picsum.photos/200/300")!  )))")
            
            
            
            
//            print((response as? HTTPURLResponse)?.allHeaderFields["picsum-id"])
            //print(response)
        }.resume()
        
        
        
    }
    
    
    func fetchImageData(urlStr: String, completion: @escaping (Result<Data, NetworkError>)-> Void){
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
            completion(.success(data))
        }.resume()
        
    }
    
    
    
    
    
    
    func getPokemonDecodable() -> Pokemon? {
    
        guard let path = Bundle.main.path(forResource: "PokeJson", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            return pokemon
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    
    
}
    
