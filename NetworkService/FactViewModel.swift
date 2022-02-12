//
//  FactViewModel.swift
//  NetworkService
//
//  Created by Abdullah Alnutayfi on 12/02/2022.
//

import Foundation
import SwiftUI
class FactViewModel : ObservableObject{
     var url = "https://catfact.ninja/fact"
    @Published var facts = ""
    func getFact(){
        NetworkingServiceManager.networkService.fetchData(url: url){ fact in
            DispatchQueue.main.async {
                self.facts = fact.fact
            }
        }
    }
}
