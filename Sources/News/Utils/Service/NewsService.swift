//
//  File.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Foundation
import Covid19StatsCore

public struct NewsAPIService {
  
  public static let baseUrl = "https://newsapi.org/v2"
  public static let apiKey = "281aab8a2b9843b284920eb64dc512d6"
  
}

public enum NewsEndpoints {
  
  public enum Gets: Endpoint {
    case topHeadlines
    
    public var url: String {
      switch self {
      case .topHeadlines: return "\(NewsAPIService.baseUrl)/top-headlines"
      }
    }
    
  }
  
}
