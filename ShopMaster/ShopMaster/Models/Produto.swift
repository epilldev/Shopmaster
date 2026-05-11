import Foundation

struct Produto: Identifiable {

    // gerador de identificador único automático pro produto
    let id = UUID()

    let nome: String

    let preco: Double
}
