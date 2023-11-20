//
//  NetworkRepository.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import Foundation

// MARK: Netwok Client Repository
/*
    Network Client Repository for Modules repo for network
 
     - Parameter(Network)  : NetworkClientService
 */

class NetwokClientRepository<Network: NetworkClientService> {
    var client: Network
    required init(client: Network) {
        self.client = client
    }
}
