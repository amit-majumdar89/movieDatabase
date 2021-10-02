import SwiftUI

struct MovieCardView: View {
    
    @State var title: String?
    @State var overview: String?
    @State var displayDate: String?
    @State var imageURL: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 5) {
                if let imagePath = imageURL {
                    ImageView(placeholder: {
                        Color.textOnPrimary
                    }, url: imagePath)
                        .frame(width: 44, height: 44)
                        .aspectRatio(contentMode: .fit)
                        .mask(Circle())
                }
                if let title = title {
                    Text(title)
                        .font(.system(size: 14, weight: .heavy, design: .monospaced))
                        .foregroundColor(.primary)
                }
            }
            if let displayDate = displayDate {
                Text(displayDate.uppercased())
                    .font(.footnote).bold()
                    .foregroundColor(.textOnPrimaryBackground)
            }
            if let overview = overview {
                Text(overview.uppercased())
                    .font(.system(size: 12))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.textOnPrimaryBackground)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .modifier(DropShadowModifier())
        
    }
}
