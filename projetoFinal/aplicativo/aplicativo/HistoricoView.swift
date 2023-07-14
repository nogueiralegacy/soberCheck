//
//  HistoricoView.swift
//  aplicativo
//
//  Created by Student02 on 14/07/23.
//

import SwiftUI

struct HistoricoView: View {
    var body: some View {
        VStack{
            Text("Historico")
                .bold()
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
        }
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
