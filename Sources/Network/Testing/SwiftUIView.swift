//
//  SwiftUIView.swift
//  NetworkManager
//
//  Created by Amin on 1/27/25.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @MainActor
    func fetch() async throws {
        do {
            let data = try await APIClient().execute(request: TestEndPoint.fetchImages)
            print("fetched image data", data)
        } catch {
            print("errorrrr",error.localizedDescription)
        }
    }
}

@available(iOS 15.0, *)
struct SwiftUIView: View {
    @StateObject var viewModel: TestViewModel = .init()

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
        .task {
            do {
                try await viewModel.fetch()
            } catch {
                print("errorrrr",error.localizedDescription)
            }
        }
    }
}

@available(iOS 15, *)
#Preview {
    SwiftUIView()
}
