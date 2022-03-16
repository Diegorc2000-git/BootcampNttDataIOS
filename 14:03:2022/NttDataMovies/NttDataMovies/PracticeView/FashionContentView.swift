//
//  FashionContentView.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import SwiftUI

struct FashionContentView: View {
	var body: some View {
		NavigationView {
			VStack(spacing: 20) {
				CustomNavigationView()
				CustomMainView()
			}.navigationBarHidden(true)
		}
	}
}

struct FashionContentView_Previews: PreviewProvider {
	static var previews: some View {
		FashionContentView()//.previewDevice("iPhone 11 Pro")
	}
}
