//
//  MovieCreditsView.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 02/10/21.
//

import SwiftUI

struct MovieCreditsView: View {
    
    var movieId: Int

    @ObservedObject var viewModel: MovieCreditViewModel
    
    init(movieId: Int) {
        self.movieId = movieId
        self.viewModel = MovieCreditViewModel(movieId: movieId)
    }
    
    var body: some View {
        ZStack {
            Color.primaryBackground
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    if viewModel.dataFetchCompleted {
                        Text("MOVIE CAST")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color.textOnPrimaryBackground)
                            .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 30)
                    }
                    if let cast = viewModel.credits?.cast {
                        ForEach(cast, id: \.id) { cast in
                            if let introduction = cast.formattedIntroduction {
                                Text(introduction)
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(Color.textOnPrimaryBackground)
                                    .padding(.top, 8)
                                    .padding(.horizontal, 15)
                            }
                        }
                    }
                    if viewModel.dataFetchCompleted {
                        Text("MOVIE CREW")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color.textOnPrimaryBackground)
                            .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 30)
                    }
                    if let crew = viewModel.credits?.crew {
                        ForEach(crew, id: \.id) { crew in
                            HStack {
                                if let crewName = crew.crewName {
                                    Text(crewName)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundColor(Color.textOnPrimaryBackground)
                                }
                                if let job = crew.job {
                                    Text(" |  " + job)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundColor(Color.textOnPrimaryBackground)
                                }
                                if let departmentName = crew.departmentName {
                                    Text(" |  " + departmentName)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundColor(Color.textOnPrimaryBackground)
                                }
                            }
                            .padding(.top, 8)
                            .padding(.horizontal, 15)
                        }
                    }
                }
            }.navigationBarTitle(Text("CREDITS"), displayMode: .inline)
        }
    }
}

struct MovieCreditsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCreditsView(movieId: 370172)
    }
}
