//
//  NetworkingServiceManager.swift
//  NetworkService
//
//  Created by Abdullah Alnutayfi on 12/02/2022.
//

import Foundation

class NetworkingServiceManager{
    static let networkService : NetworkingServiceManager = NetworkingServiceManager()
    var factResponse : Fact?
    func fetchData(url: String, com : @escaping(Fact) -> (Void)){
        guard let url = URL(string: url)else{
            print("Invalid URL . . . ")
            return
        }
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let data = data{
                DispatchQueue.global(qos: .background).async {
                    do{
                        self.factResponse = try decoder.decode(Fact.self, from: data)
                        com(self.factResponse!)
                        
                    }catch{
                        print("Error",error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

