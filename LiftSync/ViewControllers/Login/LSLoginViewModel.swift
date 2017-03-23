//
//  LSLoginViewModel.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 05.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import Foundation

protocol LSLoginViewModelDelegate {
//    func searchModel(model:QSearchModel,didFoundArtists artists:[SPTPartialArtist])
//    func searchModel(model:QSearchModel,didFoundTracks tracks:[SPTPartialTrack])
//    func loginDidFail(error:NSError)
}

final class LSLoginViewModel {
    
    private var delegate:LSLoginViewModelDelegate?
    
    init(delegate:LSLoginViewModelDelegate){
        self.delegate = delegate
    }
    
}
    
