//
//  FlippedCard.swift
//  NetworkService
//
//  Created by Abdullah Alnutayfi on 12/02/2022.
//

import Foundation
import SwiftUI

struct FlippedCard: View {
    
    @ObservedObject var vm : FactViewModel
    @State var scale : CGFloat = 1
    @State var scale2 : CGFloat = 1.3
    @State var rotationAmount : Double = 0
    var side1 : Text
    var side2 : Text
    @State var isFlipped = false
    var body: some View{
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 330, height: 400)
                .scaleEffect(isFlipped ? scale2: scale)
                .overlay(
                    ZStack{
                        Image("back")
                            .resizable()
                            .foregroundColor(.red)
                            .opacity(0.50)
                            .frame(width: 330, height: 400)
                            .cornerRadius(10)
                        ScrollView{
                            VStack{
                                if !isFlipped{
                                    side1
                                        .font(.title)
                                        .padding()
                                        .foregroundColor(.white)
                                        .rotation3DEffect(
                                            Angle.degrees(!isFlipped ? -rotationAmount:0),
                                            axis: (x: 0.0, y: 0.1, z: 0.0)
                                        )
                                }
                            }
                            if isFlipped{
                                side2
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .rotation3DEffect(
                                        Angle.degrees(isFlipped ? -rotationAmount:0),
                                        axis: (x: 0.0, y: 0.1, z: 0.0)
                                    )
                            }
                        }
                    }
                )
                .onTapGesture {
                    vm.getFact()
                    rotationAmount = rotationAmount + 180
                    withAnimation(.linear(duration: 0.5)){
                        isFlipped.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                            withAnimation(){
                                scale2 = scale
                            }
                        }
                    }
                    scale2 = 1.3
                    rotationAmount = 0
                }
                .rotation3DEffect(
                    Angle.degrees(isFlipped ? rotationAmount: 0),
                    axis: (x: 0.0, y: 0.1, z: 0.0)
                )
        }
    }
}
