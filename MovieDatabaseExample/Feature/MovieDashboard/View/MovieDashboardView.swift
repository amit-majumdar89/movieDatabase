import SwiftUI
import Combine
import MovieDatabase

struct MovieDashboardView: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    @State private var scrollViewContentOffset: CGFloat = .zero
    @State private var searchText: String = ""

    init() {
        viewModel = DashboardViewModel()
    }

    var body: some View {
        ZStack {
            Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            List {
                SearchBar(text: $searchText)
                    .padding(.vertical, 10)
                ForEach(viewModel.movieList.filter({ searchText.isEmpty ? true : $0.displayTitle.containsIgnoringCase(searchText) }), id: \.id) { movie in
                    if let movieID = movie.id {
                        NavigationLink(
                            destination: MovieDashboardDetailView(movieID: "\(movieID)"),
                            label: {
                                EmptyView()
                                CardView(title: movie.displayTitle,
                                         shortDesctiption: movie.overview,
                                         displayDate: movie.displayDate,
                                         imageURL: movie.poster_path)
                            })
                    }
                }
                .listSeparatorNone()
                if viewModel.movieListFull == false {
                    Text("Loading More...")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .onAppear {
                            print(scrollViewContentOffset)
                            viewModel.fetchMovieList()
                        }
                        .hidden()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Movie Database"), displayMode: .inline)
        }
    }
}


struct MovieDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDashboardView()
    }
}

extension String {
    func containsIgnoringCase(_ find: String) -> Bool {
         self.range(of: find, options: .caseInsensitive) != nil
    }
}
