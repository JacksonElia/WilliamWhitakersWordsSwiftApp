//
//  SearchBrain.swift
//  William Whitaker's Words Swift App
//
//  Created by Jack Elia on 11/27/21.
//

import Foundation

struct SearchBrain {
    static func getHTML(search: String, type: String) -> String {
        var urlString: String
        if type == "latin" {
            urlString = "https://archives.nd.edu/cgi-bin/wordz.pl?keyword=\(search)"
        } else if type == "english" {
            urlString = "https://archives.nd.edu/cgi-bin/wordz.pl?english=\(search)"
        } else {
            print("type has to equal latin or english")
            urlString = ""
        }
        
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
                return contents
            } catch {
                print("William Whitakers is probably down")
                return "William Whitakers is down"
            }
        } else {
            print("The URL was bad, make sure it works.")
            return "I messed up the coding. 🤦"
        }
    }
}
