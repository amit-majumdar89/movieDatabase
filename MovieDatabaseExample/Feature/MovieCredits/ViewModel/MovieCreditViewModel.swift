import Combine
import MovieDatabase

class MovieCreditViewModel: ObservableObject {
   
    private var service: MovieCreditsWebService
    private var movieId: Int
    private var cancellable: AnyCancellable?

    @Published var credits: Credits?
    @Published var dataFetchCompleted: Bool = false

    init(service: MovieCreditsWebService = MovieCreditsWebService(), movieId: Int) {
        self.service = service
        self.movieId = movieId
        fetchCredits(movieId: movieId)
    }
    
    func fetchCredits(movieId: Int) {
        self.cancellable = service.fetchCredits(for: movieId)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
            }, receiveValue: { credits in
                self.credits = credits
                self.dataFetchCompleted = true
            })
    }
}
