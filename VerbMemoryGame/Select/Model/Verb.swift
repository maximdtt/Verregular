//
//  Verb.swift
//  MVCLesson
//
//  Created by Maksims Šalajevs on 23/05/2024.
//

import Foundation

struct Verb {
    let infinitive: String
    let pastSimple: String
    let participle: String
    var translation: String {
        NSLocalizedString(self.infinitive, comment: "")
    }
}
