import SwiftUI

struct ContentView: View {
  @State var selected = "morning"
  
  var body: some View {
    CustomControl(selected: self.$selected)
    
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .padding()
  }
}

struct CustomControl : View {
  var buttonArray = ["morning", "afternoon", "evening"]
  @Binding var selected: String
  var body: some View {
    HStack(alignment: .center) {
      ForEach(0 ..< buttonArray.count) { item in
        Button(action: {
          self.selected = self.buttonArray[item]
        }) {
          Text(self.buttonArray[item])
            .frame(height: 125.0)
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(self.selected == self.buttonArray[item] ? .white : Color("grey"))
        .background(self.selected == self.buttonArray[item] ? Color("action") : Color("action-deselected"))
        .cornerRadius(5)
      }
    }
    .font(.headline)
  }
}
