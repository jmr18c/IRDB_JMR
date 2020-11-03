//
//  DataController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/22/20.
//

import UIKit

class DataController: NSObject {

    let JSONURL = "https://api.jsonbin.io/b/5fa1db45a03d4a3bab0c60b2"
    
    var dataModel: DraftDataModel?
    
    func getJSONData(completion: @escaping (_ dataModel: DraftDataModel) -> ()) {
        
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
            (data, response, error) in
            
            guard let thisData = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let thisDraftData = try decoder.decode(DraftDataModel.self, from: thisData)
                
                self.dataModel = thisDraftData
                print(thisDraftData.draftRecap[0])
                
                // Call back to the completionHandlelr and let em know we done
                
                // Go back to the main thread
                DispatchQueue.main.async {
                    // Whatever BRO
                    completion(self.dataModel!)
                }
            }
            catch let err {
                print("ERROR WAS: ", err)
            }
        }
        dataTask.resume()
    }
}
