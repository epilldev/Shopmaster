import Foundation

struct ItemCarrinho: Identifiable {

    // gerador de identificador único automático pra cada item do carrinho
    let id = UUID()

    let produto: Produto

    var quantidade: Int
}
