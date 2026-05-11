import SwiftUI

struct HomeView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 30) {

                    Spacer()

                    Image(systemName: "cart.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)

                    VStack(spacing: 10) {

                        Text("ShopMaster")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Seu app de compras favorito")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }

                    VStack(spacing: 20) {

                        NavigationLink {

                            ListaProdutosView()

                        } label: {

                            Label("Ver Produtos", systemImage: "bag.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }

                        NavigationLink {

                            CarrinhoView()

                        } label: {

                            Label("Ver Carrinho", systemImage: "cart.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
            }
        }
    }
}

#Preview {

    HomeView()
}
