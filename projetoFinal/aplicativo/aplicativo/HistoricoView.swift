//
//  HistoricoView.swift
//  aplicativo
//
//  Created by Student02 on 14/07/23.
//

import SwiftUI

struct HistoricoView: View {
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
                
            } // VStack
            
        } // ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
