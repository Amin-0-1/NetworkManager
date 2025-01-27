//
//  SwiftUIView.swift
//  NetworkManager
//
//  Created by Amin on 1/27/25.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published var imageData: Data = .init()


    @MainActor
    func fetch() async throws {
        do {
            let data = try await APIClient().execute(request: TestEndPoint.fetchImages)
            imageData = data
        } catch {
            print(error.localizedDescription)
        }
    }
}

@available(iOS 15.0, *)
struct SwiftUIView: View {
    @StateObject var viewModel: TestViewModel = .init()

    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: viewModel.imageData) ?? .add)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        }
        
        .task {
            try? await viewModel.fetch()
        }
    }
}

@available(iOS 15, *)
#Preview {
    SwiftUIView()
}
