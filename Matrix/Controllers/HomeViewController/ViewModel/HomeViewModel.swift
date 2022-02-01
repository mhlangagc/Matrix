import Foundation

final class HomeViewModel {
    
    lazy var networkController = resolve(MatrixNetworkProtocol.self)
    
    func fetchMovie() {
        let expression = "matrixressurections"
        networkController.searchMovie(withExpression: expression) { result in
            Dispatch.onMainThread {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let movieResult):
                    self.fetchMovieCast(movieResult: movieResult)
                }
            }
        }
    }
    
    func fetchMovieCast(movieResult: MovieResultsModel) {
        guard let movieID = movieResult.results?.first?.id else { return }
        networkController.fetchFullCast(forMovieWithId: movieID) { result in
            Dispatch.onMainThread {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let movieCast):
                    print(movieCast)
                }
            }
        }
    }
}
