//
//  ListScreen.swift
//  currentTimeSwiftUI
//
//  Created by Nishanth on 24/08/24.
//

import SwiftUI

struct ListScreen: View {
    @StateObject private var viewModel: CurrentDateListViewModel = CurrentDateListViewModel()
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(viewModel.currentDateVm, id: \.uuId){ data in
                
                    Text(data.currentDateString)
                        .font(.title3)
                        .padding(.init(top: 10, leading: 20, bottom: 0, trailing: 20))
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Current Date")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task{
                            await getCurrentDate()
                        }
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                    })
                }
            })
            .task {
                await getCurrentDate()
            }
        }
    }
    
    private func getCurrentDate() async{
        await self.viewModel.getCurrentDate()
    }
}

#Preview {
    ListScreen()
}
