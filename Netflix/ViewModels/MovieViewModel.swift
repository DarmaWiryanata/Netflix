//
//  MovieViewModel.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    @Published var latestMovies = [Movie]()
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getLatestMovies()
    }
    
    func loadMoreContentIfNeeded(currentMovie movie: Movie?) {
        guard let movie = movie else {
            getLatestMovies()
            return
        }

        let thresholdIndex = latestMovies.index(latestMovies.endIndex, offsetBy: -5)
        if latestMovies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
            getLatestMovies()
        }
    }
    
    private func getMovies(url: URL, hasPagination: Bool) {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                self.isLoadingPage = false
                self.currentPage += 1
            })
            .tryMap(handleOutput)
            .decode(type: MoviesResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.latestMovies.append(contentsOf: results.results)
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
        guard !isLoadingPage else { return }
        isLoadingPage = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/movie/now_playing?&page=\(currentPage)&api_key=\(Config.tmdbApiKey)") else { return }
        
        getMovies(url: url, hasPagination: false)
    }
    
    private func getActionMovies() {
        
    }
}
