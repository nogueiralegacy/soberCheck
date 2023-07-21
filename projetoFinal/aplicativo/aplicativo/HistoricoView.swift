//
//  HistoricoView.swift
//  aplicativo
//
//  Created by Student02 on 14/07/23.
//

import SwiftUI

struct HistoricoView: View {
    @StateObject var banco = Banco()

    var body: some View {
        ZStack {
            // Cor do fundo
            LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            VStack() {
                Text("Histórico")
                    .font(.system(size: 20, design: .rounded))
                    .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                
                ForEach(banco.medidas, id: \._id ){medida in
                   
                    VStack {
                        Text(medida.data)
                            .font(.subheadline)
                        .padding(3)
                                            
                        Text("\(medida.valor)")
                            .padding(.bottom, 3)
                                           
                    }
                    .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                }
            } // VStack
            .onAppear(){
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true){_ in
                    banco.fetch()
                }
            }
            
            
        } // ZStack
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
