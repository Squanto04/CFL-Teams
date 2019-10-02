//
//  CFL Controller.swift
//  CFL Teams
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation
import UIKit

class CFLController {
    
    //final URL goal: http://api.cfl.ca/v1/teams?key=T8Mv9BRDdcB7bMQUsQvHqtCGPewH5y8p
    private static let baseURL = URL(string: "http://api.cfl.ca/v1/teams")
    
    static var teamsArray:[Teams] = []
    
    static func fetchTeams(completion: @escaping () -> Void) {
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let keyComponent = URLQueryItem(name: "key", value: "T8Mv9BRDdcB7bMQUsQvHqtCGPewH5y8p")
        components?.queryItems = [keyComponent]
        guard let finalURL = components?.url else { return }
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error decoding the Data: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            do {
                let teams = try JSONDecoder().decode(TLD.self, from: data)
                self.teamsArray = teams.teamArray
                completion()
        } catch {
                print("Error decoding the data into our Team Object: \(error.localizedDescription)")
                completion(); return
            }
        }
        dataTask.resume()
    }
    
    static func getImage (for team: Teams, completion: @escaping (UIImage?) -> Void) {
        let finalURL = team.images.logoImage
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error getting image: \(error.localizedDescription)")
            }
            guard let data = data else {print("no data"); return }
            let image = UIImage(data: data)
            completion(image)
        }
        dataTask.resume()
    }
} // End of class
