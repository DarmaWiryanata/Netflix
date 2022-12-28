//
//  MovieViewModel.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: [String:[Movie]] = [
        "latest": [],
        "action": [],
        "discover": []
    ]
    @Published var isLoadingLatest = false
    @Published var isLoadingAction = false
    @Published var isLoadingDiscover = false
    
    private var currentPage = 1
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getActionMovies()
        getLatestMovies()
        getDiscoverMovies()
    }
    
//    func loadMoreContentIfNeeded(currentMovie movie: Movie?) {
//        guard let movie = movie else {
//            getLatestMovies()
//            return
//        }
//
//        let thresholdIndex = latestMovies.index(latestMovies.endIndex, offsetBy: -5)
//        if latestMovies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
//            getLatestMovies()
//        }
//    }
    
    private func getMovies(url: URL, category: String, hasPagination: Bool) {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                switch category {
                case "latest":
                    self.isLoadingLatest = false
                case "discover":
                    self.isLoadingDiscover = false
                default:
                    self.isLoadingAction = false
                }
            })
            .tryMap(handleOutput)
            .decode(type: MoviesResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.movies[category] = results.results
            })
            .store(in: &cancellables)
        
        func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
            guard
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            
            return output.data
        }
    }
    
    private func getLatestMovies() {
        guard !isLoadingLatest else { return }
        isLoadingLatest = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/movie/now_playing?api_key=\(Config.tmdbApiKey)") else { return }
        
        getMovies(url: url, category: "latest", hasPagination: false)
    }
    
    private func getActionMovies() {
        guard !isLoadingAction else { return }
        isLoadingAction = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/discover/movie?with_genres=28&api_key=\(Config.tmdbApiKey)") else { return }
        print(url)
        
        getMovies(url: url, category: "action", hasPagination: false)
    }
    
    private func getDiscoverMovies() {
        guard !isLoadingDiscover else { return }
        isLoadingDiscover = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/discover/movie?sort_by=popularity.desc&api_key=\(Config.tmdbApiKey)") else { return }
        print(url)
        
        getMovies(url: url, category: "discover", hasPagination: false)
    }
}
