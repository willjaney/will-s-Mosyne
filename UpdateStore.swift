//
//  UserStore.swift
//  greekdomSocialApp
//
//  Created by Will Janey on 3/24/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

