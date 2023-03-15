//
//  NetworkManager.swift
//  IOS UiKit Skeleton
//
//  Created by Junaed Muhammad Chowdhury on 14/10/22.
//

import Foundation


struct NetworkManager {

    static func postRequest<T: Decodable>(urlString: String, params: [String: Any], respnseType: T.Type, completionHandler: @escaping(Result<T, NetworkError>) -> Void) {

        guard let removedSpaceURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)//This will fill the spaces with the %20
            else {
            completionHandler(.failure(.invalidURL))
            return
        }


        guard let url = URL(string: removedSpaceURL) else {
            completionHandler(.failure(.invalidURL))
            return
        }


        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.setValue("application/json", forHTTPHeaderField: "Content-type")


        request.httpBody = params.percentEscaped().data(using: .utf8)
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            } catch {
//                completionHandler(.failure(error))
//                return
//            }



        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let _ = error else {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.invalidDeta))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(respnseType, from: data)
                completionHandler(.success(decodedResponse))
            } catch {
                completionHandler(.failure(.invalidDeta))
            }
        }.resume()

    }


    static func getRequest<T: Decodable>(urlString: String, respnseType: T.Type, completionHandler: @escaping(Result<T, NetworkError>) -> Void) {

        guard let removedSpaceURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)//This will fill the spaces with the %20
            else {
            completionHandler(.failure(.invalidURL))
            return
        }

        guard let url = URL(string: removedSpaceURL) else {
            completionHandler(.failure(.invalidURL))
            return
        }


        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.invalidDeta))
                return
            }

            
            do {
                let decodedResponse = try JSONDecoder().decode(respnseType, from: data)
                completionHandler(.success(decodedResponse))
            } catch {
                completionHandler(.failure(.invalidDeta))
            }
            
        }.resume()

    }

}


extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
