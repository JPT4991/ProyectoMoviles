//
//  ApiRequest.swift
//  Waiter
//
//  Created by Danny Boloban on 30/05/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import Foundation

enum APIError:Error{
    case responseProblem
    case decodingProblem
    case encondingProblem
}

struct LoginRequest {
    let resourceURL:URL
    
    init(endpoint:String) {
        let baseURL = "https://arturogil.com.mx/api/\(endpoint)"
        guard let resourceURL = URL(string: baseURL) else {fatalError()}
        print(baseURL)
        self.resourceURL = resourceURL
    }
    
    func log(_ dataToSave:DatosLogin, completion: @escaping(Result<Respuesta, APIError>) -> Void){
        do{
            var urlRequest = URLRequest(url:resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
            urlRequest.httpBody = try JSONEncoder().encode(dataToSave)
            
            let task = URLSession.shared.dataTask(with: urlRequest){
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 , let JSONData = data else {
                        print("No hubo respuesta")
                        completion(.failure(.decodingProblem))
                        return
                }
                do {
                    let contentData = try JSONDecoder().decode(Respuesta.self, from: JSONData)
                    completion(.success(contentData))
                } catch {
                    print("Error: \(error)")
                    completion(.failure(.decodingProblem))
                }
            }
            task.resume()
        } catch {
            completion(.failure(.encondingProblem))
        }
    }
    
    struct Respuesta:Codable {
        let user: MyResult
        let jwt: String
    }
    
    struct MyResult:Codable {
        let id:Int
        let username:String
        let email:String
    }
}




