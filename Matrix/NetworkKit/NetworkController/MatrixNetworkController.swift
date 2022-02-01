//
//  IMDBNetworkController.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation
import Alamofire

final class MatrixNetworkController: MatrixNetworkProtocol, APIResponseProtocol {
    let defaultError = APIError.default
    public static let shared = MatrixNetworkController()
}

extension MatrixNetworkController {
    func searchMovie(withExpression expression: String,
                     completion: @escaping(Result<MovieResultsModel, APIError>) -> Void) {
        
        let url = URLCenter.searchMovie(expression: expression).buildURL()

        APIKit.shared.fetchAPIData(withURL: url,
                                   method: .get,
                                   model: MovieResultsModel.self) { [weak self] (response, error) in

            self?.handleResponse(response: response, error: error) { (result) in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let movieResults):
                    completion(.success(movieResults))
                }
            }
        }
    }
    
    func fetchFullCast(forMovieWithId id: String,
                       completion: @escaping(Result<Movie, APIError>) -> Void) {
        let url = URLCenter.fullCast(movieID: id).buildURL()

        APIKit.shared.fetchAPIData(withURL: url,
                                   method: .get,
                                   model: Movie.self) { [weak self] (response, error) in

            self?.handleResponse(response: response, error: error) { (result) in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let movie):
                    completion(.success(movie))
                }
            }
        }
    }
}
