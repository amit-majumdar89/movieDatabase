import SwiftUI

struct KeyValueView: View {
    
    @State var key: String
    @State var value: String
    @State var keyFont: Font = .system(size: 15)
    @State var valueFont: Font = .system(size: 15)

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(key)
                .font(keyFont)
                .bold()
                .foregroundColor(.textOnPrimaryBackground)
                .padding(.horizontal, 15)
            Text(value)
                .font(valueFont)
                .italic()
                .foregroundColor(.textOnPrimaryBackground)
                .padding(.horizontal, 15)
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(key: "Key", value: "Value")
    }
}
