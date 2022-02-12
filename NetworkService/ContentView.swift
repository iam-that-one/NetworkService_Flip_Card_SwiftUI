//
//  ContentView.swift
//  NetworkService
//
//  Created by Abdullah Alnutayfi on 12/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    var url = "https://catfact.ninja/fact"
    @ObservedObject var vm = FactViewModel()
    var body: some View {
        VStack{
            FlippedCard(vm: vm, side1: Text(vm.facts), side2: Text(vm.facts))
        }.onAppear{vm.getFact()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

