//
//  LoadingView.swift
//  Future
//
//  Created by Will Janey on 4/13/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

