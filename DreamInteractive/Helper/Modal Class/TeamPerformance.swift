//
//  TeamPerformance.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 07/02/21.
//

import Foundation
struct Team : Codable {
    let name_Full : String?
    let name_Short : String?
    let player : Player?

    enum CodingKeys: String, CodingKey {

        case name_Full = "Name_Full"
        case name_Short = "Name_Short"
        case player = "Players"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name_Full = try values.decodeIfPresent(String.self, forKey: .name_Full)
        name_Short = try values.decodeIfPresent(String.self, forKey: .name_Short)
        player = try values.decodeIfPresent(Player.self, forKey: .player)
    }

}

struct Player : Codable {
    let position : String?
    let name_Full : String?
    let batting : Batting?
    let bowling : Bowling?

    enum CodingKeys: String, CodingKey {

        case position = "Position"
        case name_Full = "Name_Full"
        case batting = "Batting"
        case bowling = "Bowling"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        position = try values.decodeIfPresent(String.self, forKey: .position)
        name_Full = try values.decodeIfPresent(String.self, forKey: .name_Full)
        batting = try values.decodeIfPresent(Batting.self, forKey: .batting)
        bowling = try values.decodeIfPresent(Bowling.self, forKey: .bowling)
    }

}

struct Batting : Codable {
    let style : String?
    let average : String?
    let strikerate : String?
    let runs : String?

    enum CodingKeys: String, CodingKey {

        case style = "Style"
        case average = "Average"
        case strikerate = "Strikerate"
        case runs = "Runs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        style = try values.decodeIfPresent(String.self, forKey: .style)
        average = try values.decodeIfPresent(String.self, forKey: .average)
        strikerate = try values.decodeIfPresent(String.self, forKey: .strikerate)
        runs = try values.decodeIfPresent(String.self, forKey: .runs)
    }

}

struct Bowling : Codable {
    let style : String?
    let average : String?
    let economyrate : String?
    let wickets : String?

    enum CodingKeys: String, CodingKey {

        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        style = try values.decodeIfPresent(String.self, forKey: .style)
        average = try values.decodeIfPresent(String.self, forKey: .average)
        economyrate = try values.decodeIfPresent(String.self, forKey: .economyrate)
        wickets = try values.decodeIfPresent(String.self, forKey: .wickets)
    }

}
