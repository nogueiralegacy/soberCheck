//
//  HomeView.swift
//  aplicativo
//
//  Created by Student02 on 17/07/23.
//

import SwiftUI

struct HomeView: View {
    @State private var foiMedido = false
    var body: some View {
        ZStack {
            // Cor do fundo
            LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Text("SoberCheck")
                    .font(.system(size: 45, design: .rounded))
                    .fontWeight(.black)
                    .offset(y: 60)
                    .foregroundStyle(.purple)
                    
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color(foiMedido ? .green : .white))
                        .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.purple, lineWidth: 5)
                                )
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                foiMedido.toggle()
                            }
                        }
                        
                    
                    Text("Medir")
                        .font(.system(size: 24))
                        .bold()
                                            
                    
                } // ZStack

                Spacer()
            } // VStack
            
        } // ZStack
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
