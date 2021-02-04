//
//  NewsResponse.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Foundation

public struct NewsResponse: Decodable {
  public let articles: [News]
}

public struct News: Decodable, Hashable {
  public static func == (lhs: News, rhs: News) -> Bool {
    return lhs.author == rhs.author
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(author)
    hasher.combine(title)
    hasher.combine(description)
    hasher.combine(url)
    hasher.combine(urlToImage)
    hasher.combine(content)
  }
  
  public let author: String?
  public let title: String?
  public let description: String?
  public let url: String?
  public let urlToImage: String?
  public let content: String?
  public let source: Source?
  
}

public struct Source: Decodable {
  
  public let name: String
  
}

extension News {
  
  public static var stub: News {
    .init(
      author: "ABC Australia",
      title: "Vaksin COVID-19 yang Mulai Disuntikkan Pekan Ini, Adakah Efek Sampingnya? - detikNews",
      description: "Pekan ini, Inggris akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, masih banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.",
      url: "https://news.detik.com/abc-australia/d-5286211/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya",
      urlToImage: "https://awsimages.detik.net.id/api/wm/2020/12/08/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya_169.jpeg?wid=54&w=650&v=1&t=jpeg",
      content: "Canberra - Pekan ini Inggris dijadwalkan akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.\r\nSementara di Australia sendiri… [+5777 chars]",
      source: Source(name: "Detik.com")
    )
  }
  
}
