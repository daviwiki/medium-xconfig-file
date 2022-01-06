
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var url: String = ""
    
    func load() {
        url = "Base Url: \(Configuration.API.baseUrl)"
    }
    
}
