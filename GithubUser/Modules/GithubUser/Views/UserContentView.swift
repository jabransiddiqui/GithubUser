//
//  UserContentView.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import SwiftUI
import SwiftData

struct UserContentView: View {    
    @ObservedObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView()
                case .noResult:
                    Text(Strings.AppMessage.noResult)
                case .failed(let error):
                    ErrorView(error: error)
                case .loaded:
                    let model = viewModel.getUserList()
                    if model.isEmpty {
                        Text(Strings.AppMessage.noResult)
                    }else{
                        List(model, id: \.login) { user in
                            UserListItemView(user: user, isFavorite: viewModel.isAll ? viewModel.isFavorite(user: user) : user.isFavorite , onFavoriteBtnTap:{viewModel.onFavoriteBtnTap(user: user)} )
                        }
                    }
                }
            }
            .toolbar {
                Menu {
                    Button(action: {
                        viewModel.filterBtnTap(isAll: true)
                    }, label: {
                        Label(Strings.AppMessage.homeFilterAllText, systemImage: "list.dash")
                    })
                    
                    Button(action: {
                        viewModel.filterBtnTap(isAll: false)
                    }, label: {
                        Label(Strings.AppMessage.homeFilterFavoriteText, systemImage: "list.star")
                    })
                    
                } label: {
                    Label("", systemImage: "slider.horizontal.3")
                }
                
            }
            .navigationTitle(Strings.AppMessage.homeScreenTitleText)
        }
        .onAppear {
            viewModel.getUsers()
        }
    }
}

#Preview {
    UserContentView()
}
