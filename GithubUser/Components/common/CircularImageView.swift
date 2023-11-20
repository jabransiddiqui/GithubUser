//
//  CircularImageView.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import SwiftUI

struct CircularImageView : View {
    let imageURL : String?
    let height, width : Double?
    var body : some View{
        AsyncImage(url: URL(string: imageURL ?? "")) { imageData in
            if let image = imageData.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width ?? 50, height: height ?? 50)
                    .clipShape(Circle())
            } else if imageData.error != nil {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width ?? 50, height: height ?? 50)
                    .clipShape(Circle())
            } else {
                ProgressView()
            }
        }
    }
}
