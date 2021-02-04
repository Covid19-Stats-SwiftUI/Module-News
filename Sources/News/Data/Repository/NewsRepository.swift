//
//  NewsRepository.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Combine
import Foundation
import Covid19StatsCore

public struct NewsRepository<
  NewsRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where NewsRemoteDataSource.Response == [News],
      Transformer.Response == [News],
      Transformer.Domain == [NewsModel] {
  
  public typealias Request = Any
  public typealias Response = [NewsModel]
  
  private let _remoteDataSource: NewsRemoteDataSource
  private let _mapper: Transformer
  
  public init(remoteDataSource: NewsRemoteDataSource, mapper: Transformer) {
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: Any?) -> AnyPublisher<[NewsModel], Error> {
    _remoteDataSource.execute(request: nil)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
  
}
