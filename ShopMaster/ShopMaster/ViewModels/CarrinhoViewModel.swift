import SwiftUI
import Combine

// ObservableObject pra a View atualizar o carrinho
class CarrinhoViewModel: ObservableObject {

    // avisa as telas quando a lista mudar
    @Published var itens: [ItemCarrinho] = []

    func adicionarProduto(_ produto: Produto) {

        // valida se o produto já existe no carrinho
        if let index = itens.firstIndex(where: {
            $0.produto.id == produto.id
        }) {

            // se ja tiver aumenta a quantidade
            itens[index].quantidade += 1

        } else {
            let novoItem = ItemCarrinho(
                produto: produto,
                quantidade: 1
            )

            itens.append(novoItem)
        }
    }

    func removerProduto(_ item: ItemCarrinho) {

        // remove pelo id os itens
        itens.removeAll {
            $0.id == item.id
        }
    }

    var total: Double {

        // soma do valor total do carrinho
        itens.reduce(0) {
            $0 + ($1.produto.preco * Double($1.quantidade))
        }
    }
}
