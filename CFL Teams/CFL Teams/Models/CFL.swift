//
//  CFL.swift
//  CFL Teams
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

struct TLD: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case teamArray = "data"
    }
    let teamArray: [Teams]
}

struct Teams: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case teamid = "team_id"
        case location
        case abbreviation
        case nickname
        case fullname = "full_name"
        case venuename = "venue_name"
        case divisionid = "division_id"
        case divisionname = "division_name"
        case images
    }
    let teamid: Int
    let location: String
    let abbreviation: String
    let nickname: String
    let fullname: String
    let venuename: String
    let divisionid: Int
    let divisionname: String
    let images: Image
}

struct Image: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case logoImage = "gametracker_large_image_url"
    }
    let logoImage: URL
}
