import SwiftUI
import MovieDatabase

struct MovieDashboardDetailView: View {

    var movieID: String
    var pageNumber: Int

    @ObservedObject var viewModel: MovieDashboardDetailViewModel
    
    @State private var isMovieCreditLinkActive: Bool = false
    @State private var isSimilarMoviesActive: Bool = false

    init(movieID: String, pageNumber: Int = 1) {
        self.movieID = movieID
        self.pageNumber = pageNumber
        self.viewModel = MovieDashboardDetailViewModel(movieID: movieID, pageNumber: pageNumber)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Movie Poster
                if let imageName = viewModel.movieDetail?.poster_path {
                    ImageView(placeholder: {
                        Color.textOnPrimary
                    }, url: imageName)
                    .frame(height: 600)
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.gray, lineWidth: 0.5)
                     )
                }
                // Other Information about Movie Details
                ForEach(viewModel.keyValuePair, id: \.id) { pair in
                    if !pair.key.isEmpty && !pair.value.isEmpty {
                        KeyValueView(key: pair.key, value: pair.value)
                                    .padding(.top, 15)
                                    .padding(.horizontal, 15)
                    }
                }
                // Reviews
                Divider()
                if let results = viewModel.movieReview?.results,
                      !results.isEmpty {
                    Text("Reviews:")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(.textOnPrimaryBackground)
                        .padding(.top, 15)
                        .padding(.leading, 32)
                    ForEach(results, id: \.id) { review in
                        if let author = review.author,
                           let content = review.content,
                           !author.isEmpty,
                           !content.isEmpty {
                            KeyValueView(key: author,
                                         value: content,
                                         keyFont: .system(size: 17))
                                        .padding(.top, 15)
                                        .padding(.horizontal, 15)
                            Divider()
                        }
                    }
                }
                VStack(spacing: 10) {
                    NavigationLink(destination: MovieCreditsView(movieId: Int(movieID)!),
                                   isActive: $isMovieCreditLinkActive) {
                        Button(action: {
                            isMovieCreditLinkActive = true
                        }, label: {
                            Text("Movie Credits".uppercased())
                                .font(.system(size: 12))
                                .bold()
                                .frame(width: 300, height: 44)
                                .foregroundColor(.textOnPrimary)
                                .background(Color.primary)
                                .cornerRadius(8.0)
                        })
                    }
                    NavigationLink(destination: SimilarMoviesView(movieId: Int(movieID)!),
                                   isActive: $isSimilarMoviesActive) {
                        Button(action: {
                            isSimilarMoviesActive = true
                        }, label: {
                            Text("Similar Movies".uppercased())
                                .font(.system(size: 12))
                                .bold()
                                .frame(width: 300, height: 44)
                                .foregroundColor(.textOnPrimary)
                                .background(Color.primary)
                                .cornerRadius(8.0)
                        })
                    }
                }
                .frame(height: 120, alignment: .center)
                .padding(.leading, 50)
                Spacer()
            }
            .onAppear(perform: {
                viewModel.fetchMovieDetail(movieID: movieID)
                viewModel.fetchMovieReviews(with: movieID, and: pageNumber)
            })
        }
        .ignoresSafeArea()
    }
}

struct MovieDashboardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDashboardDetailView(movieID: "1234")
    }
}


