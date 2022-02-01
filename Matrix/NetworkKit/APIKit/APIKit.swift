//
//  APIKit.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//


import Foundation
import Alamofire

final class APIKit: APIKitProtocol {
    
    static let shared = APIKit()

    // swiftlint:disable cyclomatic_complexity function_body_length
    func fetchAPIData<Model: Decodable>(withURL url: String,
                                        parameters: Parameters = [:],
                                        headers: HTTPHeaders? = nil,
                                        method: HTTPMethod,
                                        encodedURL: Bool = true,
                                        model: Model.Type,
                                        completion: @escaping (Model?, APIError?) -> Void)  {
        
        var urlPath = URL(string: url)
        
        if encodedURL {
            guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                return
            }
            urlPath = URL(string: encodedURL)
        }
        
        // Request
        guard let urlPath = urlPath else { return }
        var request = URLRequest(url: urlPath)
        request.httpMethod = method.rawValue
        
        //  Added Headers
        if let headers = headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.name)
            }
        }
        
        // Parameters
        if !parameters.isEmpty {
            /*
            - If the HTTPMethod is a get, adding a json body parameter will resUlt in an Error
            - [-1103] Error Domain=NSURLErrorDomain Code=-1103 "resource exceeds maximum size"
            */
            if request.httpMethod == HTTPMethod.get.rawValue {
                request.httpBody?.removeAll()
            } else {
                let jsonParameters = try? JSONSerialization.data(withJSONObject: parameters)
                if let json = jsonParameters {
                    let dataAsJson = String(data: json, encoding: .utf8) ?? ""
                    print("🈶 JSON Data as Parameters for API call: \(dataAsJson).")
                }
                request.httpBody = jsonParameters
            }
        }
        
        // Session Configuration
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        
        // swiftlint:disable closure_body_length
        session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            
            if let error = error {
                let errorResponse = APIError.custom(error.localizedDescription)
                completion(nil, errorResponse)
                return
            }
            
            guard let data = data else {
                let message = "⛔️ Error fetching Data from: \(url). \n\n ---------- \nNo Data Found of expected model type: \(model)"
                let errorResponse = APIError.custom(message)
                completion(nil, errorResponse)
                return
            }
            
            // Data Decoding
            do {
                let decodedResponse = try JSONDecoder().decode(Model.self, from: data)
                print("✅ Data Result from: \(url). \n\n ---------- \nExpected Model: \(model). \n ---------- \nResponse: \(decodedResponse)")
                completion(decodedResponse, nil)
            } catch let jsonError as NSError {
                
                // Return a Bool of the Model is a bool
                if Model.self == Bool.self {
                    completion(true as? Model, nil)
                    return
                }
                
                let dataReceived = String(data: data, encoding: .utf8)
                print("📛 Failed to decode data from url: \(url). \n\n ---------- \nExpected Model: \(model). \n\n ---------- Data Package Received: \(String(describing: dataReceived)). Error: \(jsonError)")
            }
            
        }).resume()
    }
}
