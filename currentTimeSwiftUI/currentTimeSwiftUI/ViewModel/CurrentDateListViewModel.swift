//
//  CurrentDateListViewModel.swift
//  currentTimeSwiftUI
//
//  Created by Nishanth on 24/08/24.
//

import Foundation

//MARK: Main Actor act like DispatchQueue.main.asyn to refresh UI in main thread
//MARK: But Main Actor consider as this whole class will be consider as main thread so dont need to use dispatch queue

@MainActor
class CurrentDateListViewModel: ObservableObject{
    @Published var currentDateVm: [CurrentDataListVM] = []
    
    
    func getCurrentDate() async {
        
        do{
            let result = try await Webservice.sharedInstance.webRequest(apiRequestBuilder: ApiRequestBuilder().currentDateRequestBuilder)
            if let response = result{
                let data = CurrentDataListVM(currentDateModel: response)
                self.currentDateVm.append(data)
            }
        }
        catch let error{
            print("error::: \(error.localizedDescription)")
        }
    }
}


struct CurrentDataListVM{
    let currentDateModel: CurrentDateModel
    
    var uuId: UUID{
        return currentDateModel.id
    }
    var currentDateString: String{
        return currentDateModel.date
    }
}

