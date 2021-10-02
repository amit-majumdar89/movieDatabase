import Foundation

public protocol MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String
}


struct DefaultMockResponseProvider: MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String {
        return ""
    }
}
