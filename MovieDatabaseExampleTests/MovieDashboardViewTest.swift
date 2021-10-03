
import XCTest

@testable import MovieDatabaseExample

class MovieDashboardViewTest: XCTestCase {
   
    func test_fetch_now_playing_movies() {
       let viewModel = DashboardViewModel()
        viewModel.fetchMovieList()
        XCTAssertFalse(!viewModel.movieList.isEmpty)
    }
}
