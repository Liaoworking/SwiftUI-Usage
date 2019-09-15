//
//  loadDataViewModel.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/15.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
final class LoadDataViewModel: ObservableObject {
    
    @Published var todoModel: TodoModel = TodoModel()
       
    func fetchUserInfo() {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let model = try! JSONDecoder().decode(TodoModel.self, from: data!)
            // must in the main thread
            DispatchQueue.main.async {
                self.todoModel = model
            }
        }
        session.resume()
    }
}

struct TodoModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
    var location: String?
}
