//
//  GetNewsRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Combine
import Alamofire
import Foundation
import Covid19StatsCore

public struct GetNewsRemoteDataSource: DataSource {
  
  public typealias Request = String
  public typealias Response = [News]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Request?) -> AnyPublisher<[News], Error> {
    return Future<[News], Error> { completion in
      
      guard
        let url = URL(string: "\(_endpoint)?country=id&category=health&apiKey=\(NewsAPIService.apiKey)") else {
        return
      }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: NewsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result.articles))
          case .failure:
            completion(.failure(NewsAPIError.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
