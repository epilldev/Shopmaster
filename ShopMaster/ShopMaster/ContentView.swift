import SwiftUI

struct ContentView: View {

    @StateObject var carrinhoViewModel = CarrinhoViewModel()

    var body: some View {

        HomeView()
            .environmentObject(carrinhoViewModel)
    }
}

#Preview {
    ContentView()
}
