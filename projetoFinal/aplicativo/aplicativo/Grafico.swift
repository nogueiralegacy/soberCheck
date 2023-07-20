import SwiftUI
import Charts

struct Grafico: View {
    @StateObject var banco = Banco()
    
    var body: some View {
        
        VStack{
            ForEach(banco.medidas, id: \._id) { medida in
                Text(medida.data)
            }
            
            Text("\(banco.medidas.count)")
                Text("Medição de BPM ao longo do dia")
                    .multilineTextAlignment(.center)
                Chart {
                    ForEach(banco.medidas, id: \._id ){medida in

                        LineMark(
                            x: .value("Value", medida.data),
                            y: .value("Mount", Double(medida.valor)!)
                        ).interpolationMethod(.cardinal)

                    }
                }
                .chartYAxis {
                                  AxisMarks(position: .leading)
                }

                .frame(height: 400)
            
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
                banco.fetch()
            }
            //viewModel.fetch()
        }
    }
}


struct Grafico_Previews: PreviewProvider {
    static var previews: some View {
        Grafico()
    }
}
