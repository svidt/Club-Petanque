//
//  3DTrophyView.swift
//  Club Petanque
//
//  Created by Kristian Emil on 11/05/2024.
//

import SwiftUI

struct DimentialTrophy: View {
    var body: some View {
        OnboardTrophyView()
            .frame(height: 500)
            .ignoresSafeArea()
    }
}

#Preview {
    DimentialTrophy()
}
