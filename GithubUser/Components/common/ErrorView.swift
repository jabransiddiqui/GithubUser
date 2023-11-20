//
//  ErrorView.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 17/11/2023.
//

import SwiftUI

struct ErrorView: View {
    
    let error: AppErrors
    
    var body: some View {
        VStack {
            Text("Something went wrong")
                .font(.title)
                .padding()
            Group {
                switch error {
                case .noInternet:
                    Text("Please check your internet connection")
                case .serverError(let code):
                    switch code {
                    case 403:
                        Text("Github API limit reached, wait a second")
                    case 503:
                        Text("Service unavailable")
                    default:
                        Text("Server error code: \(code)")
                    }
                case .decodingError:
                    Text("Json decoding error")
                case .urlError(let urlEr):
                    Text(urlEr.localizedDescription)
                case .other(let err):
                    Text("Please contact developer \(err.localizedDescription)")
                case .invalidUrl:
                    Text(Strings.AppErrorMessage.invalidURLMessage)
                case .dbIsNotInit:
                    Text(Strings.AppErrorMessage.dbIsNotInit)
                case .unknown:
                    Text(Strings.AppErrorMessage.unknownErrorMessage)
                }
            }
            .padding()
        }
    }
}
