//
//  StateFilter.swift
//  HelloState
//
//  Created by Julio Ismael Robles on 19/11/2021.
//

import SwiftUI

struct StateFilter: View {
    
    var models = Dish.all()
    @State private var isSpicy = false
    
    var body: some View {
        VStack {
            List {
                ///by adding the binding on isspicy when the toggle is used it will update it's value
                Toggle(isOn: $isSpicy, label: {
                    Text("Spicy")
                        .font(.title)
                })
                ForEach(models.filter {$0.isSpicy == self.isSpicy}) { dish in
                    HStack {
                        Image(dish.imageURL)
                            .resizable()
                            .frame(width: 150, height: 100)
                        Text(dish.name)
                            .font(.title)
                            .lineLimit(nil)
                        Spacer()
                        if dish.isSpicy {
                            Image("sipcy-icon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                    }
                }
            }
        }
    }
}

struct StateFilter_Previews: PreviewProvider {
    static var previews: some View {
        StateFilter()
    }
}
