import Foundation

struct Medida: Codable{
    let _id: String
    let _rev: String
    let dataHora: String
    let valor: Double
}

class Banco : ObservableObject {
    @Published var chars : [Medida] = []
    
    func fetch() {
        guard let url = URL(string: "http://192.168.0.158:1880/dadoRead")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Medida].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


