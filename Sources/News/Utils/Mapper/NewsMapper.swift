//
//  File.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Foundation
import Covid19StatsCore

public struct NewsMapper: Mapper {
  
  public typealias Response = [News]
  public typealias Domain = [NewsModel]
  static let defaultImage = "https://ec.europa.eu/programmes/creative-europe/sites/default/files/covid19-cdc-unsplash.jpg"
  
  public init() { }
  
  public func transformResponseToDomain(response: [News]) -> [NewsModel] {
    return response.map {
      let source = SourceModel(name: $0.source?.name ?? "")
      
      return NewsModel(
        author: $0.author ?? "Unknown",
        title: $0.title ?? "",
        description: $0.description ?? "",
        url: $0.url ?? "",
        urlToImage: $0.urlToImage ?? NewsMapper.defaultImage,
        content: $0.content ?? "",
        source: source
      )
    }
  }
  
}
