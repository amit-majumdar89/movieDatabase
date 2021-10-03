import Foundation
import XCTest

@testable import MovieDatabaseExample
@testable import MovieDatabase

class MovieDetailsTestCases: XCTestCase {
   
    func test_fetch_movie_reviews() {
        let reviewService = MovieReviewWebService()
        let detailsService = MovieDetailsWebService()

        let viewModel = MovieDashboardDetailViewModel(movieDetailsService: detailsService, reviewService: reviewService, movieID: "370172", pageNumber: 1)
        viewModel.fetchMovieReviews(with: "370172", and: 1)
        if let reviews = viewModel.movieReview?.results {
            XCTAssertFalse(!reviews.isEmpty)
        }
    }
    
    func test_fetch_movie_details() {
        let reviewService = MovieReviewWebService()
        let detailsService = MovieDetailsWebService()

        let viewModel = MovieDashboardDetailViewModel(movieDetailsService: detailsService, reviewService: reviewService, movieID: "370172", pageNumber: 1)
        viewModel.fetchMovieDetail(movieID: "370172")
        XCTAssertFalse(viewModel.movieDetail != nil)
    }

}
