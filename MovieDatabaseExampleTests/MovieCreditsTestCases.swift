import Foundation
import XCTest

@testable import MovieDatabaseExample
@testable import MovieDatabase

class MovieCreditsTestCases: XCTestCase {
    
    func test_fetch_movie_cast() {
        let viewModel = MovieCreditViewModel(movieId: 370172)
        viewModel.fetchCredits(movieId: 370172)
        if let cast = viewModel.credits?.cast {
            XCTAssertFalse(!cast.isEmpty)
        }
    }
    
    func test_fetch_movie_crew() {
        let viewModel = MovieCreditViewModel(movieId: 370172)
        viewModel.fetchCredits(movieId: 370172)
        if let crew = viewModel.credits?.crew {
            XCTAssertFalse(!crew.isEmpty)
        }
    }
    
}
