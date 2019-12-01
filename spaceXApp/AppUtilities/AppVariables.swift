//
//  AppVariables.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 26.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation

struct api {
    static let url = "https://api.spacexdata.com"
}

var RocketArray : [(rocket_id: String, rocket_name: String, rocket_type: String, mission_name: String, launch_year: String,  mission_patch_small: String, mission_patch: String, details: String)] = []
    var selectedID = Int()
