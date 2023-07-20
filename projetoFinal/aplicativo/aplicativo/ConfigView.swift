import SwiftUI

struct ConfigView: View {

    @ObservedObject var favoritesStore: FavoritesStore = .standard

    var body: some View {
        NavigationView {
            List(favoritesStore.favorites, id: \.self) { favorite in
                NavigationLink(favorite) {
                    FavoriteDetailView(favorite: favorite)
                }
            }.navigationTitle("Configurações")
        }
    }
}

struct FavoriteDetailView: View {

    let favorite: String

    var body: some View {
        VStack {
            Text(favorite)
        }
    }
}

final class FavoritesStore: ObservableObject {
    static let standard = FavoritesStore()

    @Published var favorites: [String] = ["Dados Coletados", "Sobre", "Direitos"]

    func add(_ favorite: String) {
        favorites.append(favorite)
    }

    func remove(_ favorite: String) {
        favorites.removeAll(where: { $0 == favorite })
    }
}
