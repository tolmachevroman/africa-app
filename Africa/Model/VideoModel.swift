//
//  VideoModel.swift
//  Africa
//
//  Created by Roman Tolmachev on 22.01.2024.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}
