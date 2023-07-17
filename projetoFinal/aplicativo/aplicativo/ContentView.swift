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
                TabView {
                    HomeView()
                        .badge(2)
                        .tabItem {
                            Label("HomeKit", systemImage: "tray.and.arrow.down.fill")
                        }
                    HistoricoView()
                        .tabItem {
                            Label("clock.arrow.circlepath", systemImage: "tray.and.arrow.up.fill")
                        }
                    ConfigView()
                        .badge("gear")
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle.fill")
                        }
                }
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
