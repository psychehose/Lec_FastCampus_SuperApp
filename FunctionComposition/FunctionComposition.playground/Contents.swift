import UIKit

  // map, flatMap function
  // 차이점은 서술하기



struct MyModel: Decodable {
  let name: String
}

let myLabel = UILabel()

if let data = UserDefaults.standard.data(forKey: "my_data_key") {
  if let model = try? JSONDecoder().decode(MyModel.self, from: data) {
    let welcomeMessage = "Hello \(model.name)"
    myLabel.text = welcomeMessage
  }
}


let welcomeMessage = UserDefaults.standard.data(forKey: "my_date_key")
  .flatMap { try? JSONDecoder().decode(MyModel.self, from: $0) }
  .map(\.name)
  .map { "Hello \($0)" }

myLabel.text = welcomeMessage

