import SwiftUI

struct ContentView: View {
    @State var target = Int.random(in: 1...99)
    @State var userSelection = 50.0
    @State var alertIsVisible = false
//    @State var round = 1
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close to the target as you can: ")
                Text("\(target)")
            }  // target
            Spacer()
            HStack{
                Text("1")
                Slider(value: $userSelection,in: 1...100)
                    .accentColor(.green)
                Text("100")
            }.padding()  // slider
            Spacer()
            HStack {
                Spacer()
                Button(action:{alertIsVisible = true}) {
                    Text("Hit me!")
                }
                Spacer()
            } // confirm button
            Spacer()
        }
        .alert(isPresented: $alertIsVisible) { () -> Alert in
            let roundedValue = Int(self.userSelection.rounded())
            let accuracy = 100 - abs(target - roundedValue)
            return Alert(title: Text("Game Over!"),
                         message: Text("You chose: \(roundedValue). \n" +
                                      "The target was: \(target). \n" +
                                       "Your accuracy: \(accuracy)%"), dismissButton: .default(Text("Awesome!")) {
//                self.round += 1
                self.target = Int.random(in: 1...99)
                self.userSelection = 50.0
            })
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
