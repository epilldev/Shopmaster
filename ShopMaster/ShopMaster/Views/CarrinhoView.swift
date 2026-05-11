import SwiftUI

struct CarrinhoView: View {

    @EnvironmentObject var carrinhoViewModel: CarrinhoViewModel

    var body: some View {

        ZStack {

            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack {

                ScrollView {

                    VStack(spacing: 20) {

                        ForEach(carrinhoViewModel.itens) { item in

                            VStack(alignment: .leading, spacing: 15) {

                                HStack {

                                    Image(systemName: "cart.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.blue)

                                    VStack(alignment: .leading) {

                                        Text(item.produto.nome)
                                            .font(.headline)

                                        Text(
                                            "Quantidade: \(item.quantidade)"
                                        )
                                        .foregroundColor(.gray)
                                    }

                                    Spacer()
                                }

                                Text(
                                    "Preço: R$ \(item.produto.preco, specifier: "%.2f")"
                                )
                                .font(.headline)
                                .foregroundColor(.green)

                                Button {

                                    carrinhoViewModel.removerProduto(item)

                                } label: {

                                    Label(
                                        "Remover Item",
                                        systemImage: "trash.fill"
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }

                VStack(spacing: 15) {

                    Text(
                        "Total: R$ \(carrinhoViewModel.total, specifier: "%.2f")"
                    )
                    .font(.title2)
                    .fontWeight(.bold)

                    Button {

                    } label: {

                        Label(
                            "Finalizar Compra",
                            systemImage: "creditcard.fill"
                        )
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                }
                .padding()
                .background(Color.white)
            }
        }
        .navigationTitle("Carrinho")
    }
}

#Preview {

    CarrinhoView()
        .environmentObject(CarrinhoViewModel())
}
