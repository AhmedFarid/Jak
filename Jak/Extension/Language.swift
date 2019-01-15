//
//  Language.swift
//  Jak
//
//  Created by farido on 1/15/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//


import Foundation

class Language {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        let fristlang = langs.firstObject as! String
        return fristlang
    }
    
    class func setAppLanguage(lang: String){
        let def = UserDefaults.standard
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
}
