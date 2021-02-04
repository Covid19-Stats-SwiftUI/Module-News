//
//  NewsModel.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Foundation

public struct NewsModel: Equatable, Identifiable {
  
  public let id = UUID()
  public let author: String
  public let title: String
  public let description: String
  public let url: String
  public let urlToImage: String
  public let content: String
  public let source: SourceModel
  
  public init(
    author: String,
    title: String,
    description: String,
    url: String,
    urlToImage: String,
    content: String,
    source: SourceModel
  ) {
    self.author = author
    self.title = title
    self.description = description
    self.url = url
    self.urlToImage = urlToImage
    self.content = content
    self.source = source
  }
  
}

public struct SourceModel: Equatable {
  
  public let name: String
  
  public init(name: String) {
    self.name = name
  }
  
}

extension NewsModel {
  
  public static var stub: NewsModel {
    .init(
      author: "ABC Australia",
      title: "Vaksin COVID-19 yang Mulai Disuntikkan Pekan Ini, Adakah Efek Sampingnya? - detikNews",
      description: "Pekan ini, Inggris akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, masih banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.",
      url: "https://news.detik.com/abc-australia/d-5286211/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya",
      urlToImage: "https://awsimages.detik.net.id/api/wm/2020/12/08/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya_169.jpeg?wid=54&w=650&v=1&t=jpeg",
      content: "Canberra - Pekan ini Inggris dijadwalkan akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.\r\nSementara di Australia sendiri… [+5777 chars]",
      source: SourceModel(name: "Detik.com")
    )
  }
  
}
