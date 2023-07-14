//
//  ContentView.swift
//  aplicativo
//
//  Created by Student03 on 13/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var foiMedido = false
    
    var body: some View {
        ZStack {
            // Cor do fundo
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Text("SoberCheck")
                    .font(.system(size: 45, design: .rounded))
                    .fontWeight(.black)
                    .offset(y: 60)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color(foiMedido ? .green : .brown))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
