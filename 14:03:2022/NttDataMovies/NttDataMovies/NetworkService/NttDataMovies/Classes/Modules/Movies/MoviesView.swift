//
//  MoviesView.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import SwiftUI

struct MoviesView: View {
	
	@ObservedObject var presenter: MoviesPresenter
	
	var body: some View {
		VStack {
			if !self.presenter.arrayMovies.isEmpty {
				List(self.presenter.arrayMovies) { item in
					Text(item.artistName ?? "")
				}
			} else {
				Button(action: {
					self.presenter.fetchDataFromItunes()
				}, label: {
					Text("try again")
				})
			}
		}
		.navigationTitle("iTunes Movies")
		.onAppear(perform: {
			self.presenter.fetchDataFromItunes()
		})
	}
}

struct MoviesView_Previews: PreviewProvider {
	static var previews: some View {
		MoviesView(presenter: MoviesPresenter())
	}
}
