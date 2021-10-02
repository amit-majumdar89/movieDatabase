import Combine
import MovieDatabase

class DashboardViewModel: ObservableObject {
    
    var cancellable: AnyCancellable?
    
    @Published var movieList: [MovieListModel] = []
    
    var service: MovieListWebService
    var currentPage: Int = 1
    var movieListFull = false
    var totalPages: Int = 1
    
    init(service: MovieListWebService = MovieListWebService()) {
        self.service = service
        fetchMovieList()
    }
    
    func fetchMovieList() {
        self.cancellable = service.fetchNowPlayingMovies(pageNum: currentPage)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
                self.currentPage += 1
            }, receiveValue: { movieListContainer in
                self.totalPages = movieListContainer.total_pages ?? .zero
                self.movieListFull = (self.totalPages == self.currentPage)
                if let list = movieListContainer.movieLists {
                    list.forEach { self.movieList.append($0) }
                }
            })
    }
}
