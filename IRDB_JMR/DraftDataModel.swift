//
//  MediaDataModel.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/22/20.
//

import UIKit

class DraftDataModel: Codable {
    var draftRecap: [Draft]
}

class Draft: Codable {
    let header: String
    let teamEntries: [Teams]
}

class Teams: Codable {
    let teamName: String
    let owner: String
    let draftSpot: Int
    let prevYrFinish: String
    let prevYrRecord: String
    let draftGrade: String
    let projFinish: String
    let logoURL: String
    let draftSummary: String
    let picks: [Picks]
}

class Picks: Codable {
    let playerName: String
    let pickNum: String
}
