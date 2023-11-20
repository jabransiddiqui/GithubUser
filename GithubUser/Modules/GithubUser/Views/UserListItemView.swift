//
//  UserListItemView.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import SwiftUI

struct UserListItemView: View {
    let user: GithubUser
    let isFavorite : Bool
    var onFavoriteBtnTap: () -> Void
    var body: some View {
        HStack{
            CircularImageView(imageURL: user.avatarURL, height: 50, width: 50)
            VStack(alignment: .leading) {
                Text((user.login ?? "").capitalized)
                    .font(.headline)
                Text((user.type ?? "").capitalized)
            }
            Spacer()
            Image(systemName: isFavorite == false ? "star" : "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 25))
                .onTapGesture {
                    onFavoriteBtnTap()
                }
        }
        
    }
}
