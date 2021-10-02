//
//  SimilarMoviesView.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 02/10/21.
//

import SwiftUI

struct SimilarMoviesView: View {
    
    var movieId: Int

    @ObservedObject var viewModel: SimilarMoviesViewModel
    
    init(movieId: Int) {
        self.movieId = movieId
        self.viewModel = SimilarMoviesViewModel(movieId: movieId)
    }
    var body: some View {
        ZStack {
            Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            List {
                ForEach(viewModel.similarMovies, id: \.id) { movie in
                    MovieCardView(title: movie.displayTitle,
                             overview: movie.overview,
                             displayDate: movie.displayDate,
                             imageURL: movie.posterPath)
                        .padding(.top, 15)
                }
                .listSeparatorNone()
                if viewModel.noMorePagesAvailable == false {
                    Text("Loading More...")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .onAppear {
                            viewModel.fetchSimilarMovies(movieId: movieId)
                        }
                        .hidden()
                }
            }
            // Ignore safe area to take up whole screen
            .background(Color.primaryBackground.ignoresSafeArea())
            .onAppear {
                // Set the default to clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("SIMILAR MOVIES"), displayMode: .inline)
    }
}

struct SimilarMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SimilarMoviesView(movieId: 370172)
    }
}
