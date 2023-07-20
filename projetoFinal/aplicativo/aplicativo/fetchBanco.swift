import Foundation

struct Medida: Codable {
    let _id: String
    let _rev: String
    let valor: String
    let data: String
}

class Banco : ObservableObject {
    @Published var medidas: [Medida] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/todos")
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
                    var med: [Medida] = []
                    med = parsed
                    
                    func convertStringToDate(_ dateString: String) -> Date? {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/M/yyyy HH:mm:ss"
                        return dateFormatter.date(from: dateString)
                    }
                    
                    let medidasOrdenadas = med.sorted(by: { medida1, medida2 in
                        if let date1 = convertStringToDate(medida1.data),
                           let date2 = convertStringToDate(medida2.data) {
                            return date1 < date2
                        } else {
                            return false // Se a conversão falhar, a ordem não será alterada.
                        }
                    })
                    
                    // Passo 2: Selecionar as 10 medidas mais recentes
                    let medidasMaisRecentes = Array(medidasOrdenadas.suffix(10))
                    
                    self?.medidas = medidasMaisRecentes
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


