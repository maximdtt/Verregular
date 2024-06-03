//
//  IrregularVerbs.swift
//  MVCLesson
//
//  Created by Maksims Šalajevs on 23/05/2024.
//

import Foundation

final class IrregularVerbs {
    
    static var shared = IrregularVerbs()
    private init() {
         configureVerbs()
        
    }
    
    // MARK: - Properties
    
    private(set) var verbs: [Verb] = []
    var selectedVerbs: [Verb] = [
        Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
        Verb(infinitive: "draw", pastSimple: "drew", participle: "drawn"),
        Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
        Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
        Verb(infinitive: "awake", pastSimple: "awoke", participle: "awoken"),
        Verb(infinitive: "rise", pastSimple: "arose", participle: "arisen"),
        Verb(infinitive: "bite", pastSimple: "bit", participle: "bitten"),
        Verb(infinitive: "bet", pastSimple: "bet", participle: "bet"),
        Verb(infinitive: "breed", pastSimple: "bred", participle: "bred"),
        Verb(infinitive: "dig", pastSimple: "dug", participle: "dug"),
        Verb(infinitive: "drive", pastSimple: "drove", participle: "driven"),
        Verb(infinitive: "fight", pastSimple: "fought", participle: "fought"),
        Verb(infinitive: "give", pastSimple: "gave", participle: "given"),
        Verb(infinitive: "hurt", pastSimple: "hurt", participle: "hurt"),
        Verb(infinitive: "pay", pastSimple: "paid", participle: "paid")
    ]
    
    // MARK: - Methods 
    
    private func configureVerbs() {
        verbs = [
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "draw", pastSimple: "drew", participle: "drawn"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
            Verb(infinitive: "awake", pastSimple: "awoke", participle: "awoken"),
            Verb(infinitive: "rise", pastSimple: "arose", participle: "arisen"),
            Verb(infinitive: "bite", pastSimple: "bit", participle: "bitten"),
            Verb(infinitive: "bet", pastSimple: "bet", participle: "bet"),
            Verb(infinitive: "breed", pastSimple: "bred", participle: "bred"),
            Verb(infinitive: "dig", pastSimple: "dug", participle: "dug"),
            Verb(infinitive: "drive", pastSimple: "drove", participle: "driven"),
            Verb(infinitive: "fight", pastSimple: "fought", participle: "fought"),
            Verb(infinitive: "give", pastSimple: "gave", participle: "given"),
            Verb(infinitive: "hurt", pastSimple: "hurt", participle: "hurt"),
            Verb(infinitive: "pay", pastSimple: "paid", participle: "paid")
        ]
    }
}
