import XCTest

@testable import MovieDatabaseExample

class SimilarMovieTestCases: XCTestCase {
   
    func test_fetch_similar_movies() {
        let viewModel = SimilarMoviesViewModel(movieId: 370172)
        viewModel.fetchSimilarMovies(movieId: 370172)
        XCTAssertFalse(!viewModel.similarMovies.isEmpty)
    }
}
