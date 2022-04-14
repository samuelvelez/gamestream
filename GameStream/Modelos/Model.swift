//
//  Model.swift
//  GameStream1
//
//  Created by Samuel on 22/3/22.
//

import Foundation


struct Games: Codable, Hashable {
    
    var games:[Game]
}

struct Resultados: Codable, Hashable {
    
    var results:[Game]
}

struct Game: Codable, Hashable {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: videoUrl
    var galleryImages: [String]
    
    
}

struct videoUrl: Codable, Hashable {
    var mobile: String
    var tablet: String
}
