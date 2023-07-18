//
//  ContentView.swift
//  aplicativo
//
//  Created by Student03 on 13/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Medir", systemImage: "house")
                    }
                HistoricoView()
                    .tabItem {
                        Label("Historico", systemImage: "clock.arrow.circlepath")
                    }
                ConfigView()
                    .tabItem {
                        Label("Configuracoes", systemImage: "gear")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
