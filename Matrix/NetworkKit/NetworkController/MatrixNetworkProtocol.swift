//
//  MatrixNetworkProtocol.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

protocol MatrixNetworkProtocol {
    func searchMovie(withExpression expression: String,
                            completion: @escaping(Result<MovieResultsModel, APIError>) -> Void)
    func fetchFullCast(forMovieWithId id: String,
                       completion: @escaping(Result<Movie, APIError>) -> Void)
}
