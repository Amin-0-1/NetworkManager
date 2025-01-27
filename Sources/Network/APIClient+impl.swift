// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

extension APIClient: ModernConcurrencyAPIProtocol {
    public func execute(request: any EndPoint) async throws -> Data {
        guard let request = request.request else {
            throw NetworkError.invalidURL(request.urlComponents.string)
        }
        self.request = request
        request.log()

        do {
            let data: (data: Data, response: URLResponse) = try await session.data(for: request)
            let response = Response(response: data.response, data: data.data)
            let dataObject = try handleSuccess(response: response)
            return dataObject
        } catch {
            throw handle(error: error)
        }
    }
}
