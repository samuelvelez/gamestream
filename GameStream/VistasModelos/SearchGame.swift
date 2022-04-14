//
//  SearchGame.swift
//  GameStream
//
//  Created by Samuel on 30/3/22.
//

import Foundation

class SearchGame: ObservableObject{

    @Published var gameInfo = [Game]()
    
    //https://gamestream-api.herokuapp.com/api/games/search?contains=
    
    func search(gameName: String){
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do{
                if let jsonData = data{
                    print("tamaño del json \(jsonData)")
                    let decodeData = try
                    JSONDecoder().decode(Resultados.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            }catch{
                print("Error: \(error)")
            }
        }.resume()
    }
 /*
    init(){
        
        
    }
  */
}
