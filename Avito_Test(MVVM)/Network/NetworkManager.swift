//
//  NetworkManager.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import Foundation

// MARK: -  Network Errors
enum NetworkErrors: Error {
    case urlSessionError
    case invalidResponse
    case invalidData
    case httpStatusCode(Int)
    case error(err: String)
    case decodingError(err: String)
}

// MARK: - NetworkManager Class
final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else  {
                print(String(describing: error))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.urlSessionError))
                return
            }
            guard 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.httpStatusCode(httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
             
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                print(String(describing: error))
                completion(.failure(.decodingError(err: error.localizedDescription)))
            }
        }.resume()
    }
}
