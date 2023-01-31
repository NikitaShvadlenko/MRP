struct ErrorResponse: Codable {
     let errors: [ErrorFromServer]
     let status: String
}

// MARK: - Error
struct ErrorFromServer: Codable {
    let field: String
    let messages: [String]
}
 struct SimpleError: Decodable {
    let detail: String
}
