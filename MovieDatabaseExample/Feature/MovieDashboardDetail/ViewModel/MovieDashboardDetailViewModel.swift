import Combine
import MovieDatabase

class MovieDashboardDetailViewModel: ObservableObject {
   
    var movieDetailsService: MovieDetailsWebService
    var reviewService: MovieReviewWebService
    var movieID: String
    var pageNumber: Int

    var detailsCancellable: AnyCancellable?
    var reviewCancellable: AnyCancellable?

    @Published var movieDetail: MovieDetail?
    @Published var movieReview: MovieReview?

    init(movieDetailsService: MovieDetailsWebService = MovieDetailsWebService(),
         reviewService: MovieReviewWebService = MovieReviewWebService(),
         movieID: String,
         pageNumber: Int) {
        self.movieDetailsService = movieDetailsService
        self.reviewService = reviewService
        self.movieID = movieID
        self.pageNumber = pageNumber
    }
    
    func fetchMovieDetail(movieID: String) {
        self.detailsCancellable = movieDetailsService.fetchMovieDetail(id: movieID)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
            }, receiveValue: { movieDetail in
                self.movieDetail = movieDetail
            })
    }
    
    func fetchMovieReviews(with movieID: String, and pageNumber: Int) {
        self.reviewCancellable = reviewService.fetchMovieReviews(with: movieID, and: pageNumber)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { val in
                print(val)
            }, receiveValue: { movieReview in
                print(movieReview)
                self.movieReview = movieReview
            })
    }
    
    var keyValuePair: [KeyValueInfo] {
        [
            .init(key: "Title:", value: movieDetail?.displayTitle ?? ""),
            .init(key: "Tagline:", value: movieDetail?.tagline ?? ""),
            .init(key: "Overview:", value: movieDetail?.overview ?? ""),
            .init(key: "Released:", value: movieDetail?.displayDate ?? ""),
            .init(key: "Homepage:", value: movieDetail?.homepage ?? ""),
            .init(key: "Genre:", value: movieDetail?.genresInfo ?? ""),
        ]
    }
    
}

struct KeyValueInfo: Identifiable {
    
    var key: String
    var value: String
    var id = UUID().uuidString
}
