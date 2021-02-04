//
//  NewsAPIError+Ext.swift
//  
//
//  Created by Ari Supriatna on 02/02/21.
//

import Foundation

enum NewsAPIError: Error {
	case invalidURL
	case invalidSerialization
	case badHTTPResponse
	case error(NSError)
	case noData
}
