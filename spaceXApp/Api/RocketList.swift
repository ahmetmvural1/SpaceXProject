//
//  RocketList.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 26.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation
import SimpleApiClient

struct RocketList: SimpleApi{
     
    

    var path: String {
        return "/v2/launches"
    }
    
    var method: HTTPMethod {
        return .get
    }
    

    

}
extension SimpleApiClient {
    func listRockets() -> Observable<[ListDataSpaceX]>  {
        return request(api: RocketList())
    }
}
