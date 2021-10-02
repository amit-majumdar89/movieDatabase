import Combine
import MovieDatabase

class SimilarMoviesViewModel: ObservableObject {
   
    private var service: SimilarMoviesWebService
    private var movieId: Int
    private var cancellable: AnyCancellable?
    private var currentPage: Int = 1
    
    @Published var similarMovies: [SimilarMovie] = []
    @Published var dataFetchCompleted: Bool = false
    @Published var noMorePagesAvailable: Bool = false

    init(service: SimilarMoviesWebService = SimilarMoviesWebService(), movieId: Int) {
        self.service = service
        self.movieId = movieId
        fetchSimilarMovies(movieId: movieId)
    }
    
    func fetchSimilarMovies(movieId: Int) {
        self.cancellable = service.fetchSimilarMovies(for: movieId, in: currentPage)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
                self.currentPage += 1
            }, receiveValue: { similarMovies in
                self.dataFetchCompleted = true
                self.noMorePagesAvailable = (similarMovies.totalPages == self.currentPage)
                if let results = similarMovies.results {
                    results.forEach { (movie) in
                        self.similarMovies.append(movie)
                    }
                }
            })
    }
}
