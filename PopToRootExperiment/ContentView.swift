import SwiftUI

struct ContentView: View {
    @State var isLinkActive: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("ChildView1", destination: ChildView(1, isLinkActive: $isLinkActive), isActive: $isLinkActive)
                Text("isLinkActive = \(isLinkActive.description)")
            }
        }
    }
}

struct ChildView: View {
    let number: Int
    @Binding var isLinkActive: Bool
    init(_ number: Int, isLinkActive: Binding<Bool>) {
        self.number = number
        self._isLinkActive = isLinkActive
    }
    var body: some View {
        VStack {
            NavigationLink("ChildView\(number + 1)", destination: ChildView(number + 1, isLinkActive: $isLinkActive))
            Text("isLinkActive = \(isLinkActive.description)")
            Button("Pop to Root") {
                isLinkActive = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
