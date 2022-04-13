//
//  UpdateList.swift
//  DesignCode
//
//  Created by Yermek Sabyrzhan on 13.04.2022.
//

import SwiftUI

struct UpdateList: View {
    let color = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    @ObservedObject var store = UpdateStore()

    func addUpdate() {
        store.updates.append(
            Update(
                image: "Card1",
                title: "New Item",
                text: "text",
                date: "Jan 1"
            )
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(
                        destination: UpdateDetail(update: update)
                    ) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(color)
                                Text(update.date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { source, destination in
                    self.store.updates.move(
                        fromOffsets: source,
                        toOffset: destination
                    )
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(
                leading: Button(
                    action: addUpdate,
                    label: {
                        Text("Add update")
                    }
                ),
                trailing: EditButton()
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
