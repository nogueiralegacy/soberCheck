import SwiftUI

struct DataPoint {
    let _id: String
    let _rev: String
    let date: String
    let value: CGFloat
}

struct GradientLineChart: View {
    var dataPoints: [DataPoint]
    var lineColor: Color
    var fillColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient (optional)
                LinearGradient(gradient: Gradient(colors: [fillColor]), startPoint: .top, endPoint: .bottom)
                
                // Line Chart
                Path { path in
                    let startX = geometry.frame(in: .local).minX
                    let startY = geometry.frame(in: .local).maxY
                    let stepX = geometry.frame(in: .local).width / CGFloat(dataPoints.count - 1)
                    let stepY = geometry.frame(in: .local).height / (dataPoints.map { $0.value }.max() ?? 1)
                    
                    path.move(to: CGPoint(x: startX, y: startY))
                    
                    for i in 0..<dataPoints.count {
                        let x = startX + CGFloat(i) * stepX
                        let y = startY - dataPoints[i].value * stepY
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                .stroke(lineColor, lineWidth: 2)
                .background(fillColor.opacity(0.3)) // Fill color below the line
            }
        }
    }
}



struct Grafico_Previews: PreviewProvider {
    var medidas: [Medida] = [Medida(_id: "1", _rev: "1", dataHora: "12/03/2023", valor: 23.09), Medida(_id: "2", _rev: "2", dataHora: "12/03/2023", valor: 24.09), Medida(_id: "3", _rev: "3", dataHora: "12/03/2023", valor: 28.09), Medida(_id: "4", _rev: "4", dataHora: "12/03/2023", valor: 32.09), Medida(_id: "5", _rev: "5", dataHora: "12/03/2023", valor: 28.09), Medida(_id: "6", _rev: "6", dataHora: "12/03/2023", valor: 26.09), Medida(_id: "7", _rev: "7", dataHora: "12/03/2023", valor: 23.09), Medida(_id: "8", _rev: "8", dataHora: "12/03/2023", valor: 20.09)]
    static var previews: some View {
        Grafico(medidas, .blue, .green)
    }
}
