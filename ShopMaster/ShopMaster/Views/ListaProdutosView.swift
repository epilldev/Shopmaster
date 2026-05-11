import SwiftUI

struct ListaProdutosView: View {

    @EnvironmentObject var carrinhoViewModel: CarrinhoViewModel

    let produtos = [

        Produto(nome: "iPhone 15", preco: 5000),

        Produto(nome: "MacBook Pro", preco: 12000),

        Produto(nome: "AirPods Pro", preco: 1500),

        Produto(nome: "Samsung Galaxy S24", preco: 4500),

        Produto(nome: "Notebook Dell XPS", preco: 9800),

        Produto(nome: "Mouse Logitech MX Master 3", preco: 650),

        Produto(nome: "Teclado Mecânico Redragon", preco: 350),

        Produto(nome: "Monitor LG UltraWide", preco: 2300),

        Produto(nome: "PlayStation 5", preco: 4300),

        Produto(nome: "Xbox Series X", preco: 4100),

        Produto(nome: "Nintendo Switch OLED", preco: 2200),

        Produto(nome: "Apple Watch Series 9", preco: 3200),

        Produto(nome: "Smart TV Samsung 55", preco: 2900),

        Produto(nome: "Cadeira Gamer DXRacer", preco: 1800),

        Produto(nome: "Headset HyperX Cloud II", preco: 500),

        Produto(nome: "SSD Kingston 1TB", preco: 450),

        Produto(nome: "Placa de Vídeo RTX 4070", preco: 4200),

        Produto(nome: "Echo Dot Alexa", preco: 350),

        Produto(nome: "GoPro Hero 12", preco: 2800),

        Produto(nome: "Drone DJI Mini 4", preco: 6500)
    ]

    var body: some View {

        ZStack {

            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack {

                ScrollView {

                    VStack(spacing: 20) {

                        ForEach(produtos) { produto in

                            VStack(alignment: .leading, spacing: 15) {

                                Image(systemName: "shippingbox.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)

                                Text(produto.nome)
                                    .font(.title3)
                                    .fontWeight(.bold)

                                Text("R$ \(produto.preco, specifier: "%.2f")")
                                    .font(.headline)
                                    .foregroundColor(.green)

                                Button {

                                    carrinhoViewModel.adicionarProduto(produto)

                                } label: {

                                    Label(
                                        "Adicionar ao Carrinho",
                                        systemImage: "cart.badge.plus"
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                }
                            }
                            .padding()
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(
                                color: .black.opacity(0.1),
                                radius: 5,
                                x: 0,
                                y: 3
                            )
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }

                NavigationLink {

                    CarrinhoView()

                } label: {

                    Label(
                        "Ir para Pagamento",
                        systemImage: "creditcard.fill"
                    )
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding()
                }
            }
        }
        .navigationTitle("Produtos")
    }
}

#Preview {

    ListaProdutosView()
        .environmentObject(CarrinhoViewModel())
}
