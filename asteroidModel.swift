//
//  asteroidModel.swift
//  MVVM
//
//  Created by Nitish on 13/09/22.
//

import Foundation



// MARK: - nearObjects
struct nearObjects: Codable {
    let nearEarthObjects: [String: [NearEarthObject]]

    enum CodingKeys: String, CodingKey {
        case nearEarthObjects = "near_earth_objects"
    }
}


// MARK: - NearEarthObject
struct NearEarthObject: Codable {
    let id: String
    let absoluteMagnitudeH: Double
    let closeApproachData: [CloseApproachDatum]

    
    enum CodingKeys: String, CodingKey {
        case id
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case closeApproachData = "close_approach_data"
    }
}

// MARK: - CloseApproachDatum

struct CloseApproachDatum: Codable {
    let relativeVelocity: RelativeVelocity

    enum CodingKeys: String, CodingKey {
        case relativeVelocity = "relative_velocity"
    }
}


// MARK: - RelativeVelocity
struct RelativeVelocity: Codable {
    let kilometersPerSecond, kilometersPerHour, milesPerHour: String

    enum CodingKeys: String, CodingKey {
        case kilometersPerSecond = "kilometers_per_second"
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }
}
