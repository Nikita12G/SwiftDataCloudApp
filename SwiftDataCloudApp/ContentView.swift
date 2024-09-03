//
//  ContentView.swift
//  SwiftDataCloudApp
//
//  Created by Никита Гуляев on 03.09.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query var contacts: [Contact]
    
    @State private var newName: String = ""
    @State private var newPhoneNumber: String = ""
    @State private var newEmail: String = ""

    var body: some View {
            VStack {
                Form {
                    Section(header: Text("Add New Contact").font(.headline).foregroundStyle(.black)) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Phone Number", text: $newPhoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                        TextField("Email", text: $newEmail)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        Button(action: addContact) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add Contact")
                            }
                            .padding(5)
                        }
                        .disabled(newName.isEmpty || newPhoneNumber.isEmpty || newEmail.isEmpty)
                    }
                }
                Spacer()
                List {
                    Text("Contacts list")
                    ForEach(contacts) { contact in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(contact.name)
                                    .font(.headline)
                                Text(contact.phoneNumber)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(contact.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(contact.createdAt, style: .date)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteContacts)
                }
                .listStyle(PlainListStyle())
            }
        
    }
    
    private func addContact() {
        let newContact = Contact(name: newName, phoneNumber: newPhoneNumber, email: newEmail)
        context.insert(newContact)
        newName = ""
        newPhoneNumber = ""
        newEmail = ""
    }
    
    private func deleteContacts(at offsets: IndexSet) {
        for index in offsets {
            context.delete(contacts[index])
        }
    }
}

#Preview {
    ContentView()
}
