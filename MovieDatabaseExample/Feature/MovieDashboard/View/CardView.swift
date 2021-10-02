//
//  CardView.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 25/09/21.
//

import SwiftUI
import Combine
import MovieDatabase

struct CardView: View {
    
    @State var title: String?
    @State var shortDesctiption: String?
    @State var displayDate: String?
    @State var imageURL: String?
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
            HStack(alignment: .center, spacing: 10) {
                if let imagePath = imageURL {
                    ImageView(placeholder: {
                        Color.textOnPrimary
                    }, url: imagePath)
                        .frame(width: 100, height: 150, alignment: .center)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.gray, lineWidth: 0.5)
                         )
                }
                VStack(alignment: .leading, spacing: 10) {
                    if let title = title?.uppercased() {
                        Text(title)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.textOnPrimaryBackground)
                            .padding(.bottom, 8)
                    }
                    if let overview = shortDesctiption {
                        Text(overview)
                            .font(.system(size: 12))
                            .foregroundColor(.textOnPrimaryBackground)
                            .lineLimit(2)
                            .padding(.bottom, 3)
                    }
                    HStack {
                        if let displayDate = displayDate {
                            Text(displayDate.uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 3)
                        }
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Book".uppercased())
                                .font(.system(size: 8))
                                .bold()
                                .padding(.horizontal, 5)
                                .padding(.vertical, 3)
                                .frame(width: 50, height: 30)
                                .foregroundColor(.textOnPrimary)
                                .background(Color.primary)
                                .cornerRadius(8.0)
                        })
                    }
                }.padding(.trailing, 15)
                 .padding(.vertical, 10)
            }
        }
        .overlay(
        RoundedRectangle(cornerRadius: 4)
            .stroke(Color.gray, lineWidth: 0.5)
        )
        .padding(.top, 6)
        .padding(.leading, 6)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CardView(title: "Kate",
                     shortDesctiption: "After she's irreversibly poisoned, a ruthless criminal operative has less than 24 hours to exact revenge on her enemies and in the process forms an unexpected bond with the daughter of one of her past victims.",
                     displayDate: "2021-09-10",
                     imageURL: "https://www.google.com")
        }
    }
}
