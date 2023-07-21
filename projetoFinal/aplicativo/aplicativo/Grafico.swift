import SwiftUI
import Charts

struct Grafico: View {
    @StateObject var banco = Banco()
    
    var body: some View {
        
        VStack{
                Text("Concentração de etanol")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.black)
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
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true){_ in
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
