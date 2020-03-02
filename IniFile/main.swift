//
//  main.swift
//  IniFile
//
//  Created by Heaven Chou on 2020/2/28.
//  Copyright © 2020 CBETA. All rights reserved.
//

import Foundation

// 建立 IniFile 物件
let iniFileName = "/Users/heaven/Data/Swift/IniFile/IniFile/test.ini"
let myIni = try? CIniFile(fileName: iniFileName)

guard let myIni = myIni else {
    print("open IniFile Error")
    exit(0)
}

// test Int

var i = myIni.readInt("ABC", "item_int", 0)
assert(i==228)
myIni.writeInt("ABC", "new_item_int", i)
i = myIni.readInt("XYZ", "item_int", 0)
assert(i==64)
myIni.writeInt("XYZ", "item_int", i + 10000)

// test String

let str1 = myIni.readString("ABC", "item_str", "")
assert(str1=="字串")
let str2 = myIni.readString("XYZ", "item_str", "")
assert(str2=="羅睺=悋")
myIni.writeString("ABC", "item_str", str2)
myIni.writeString("XYZ", "item_str", str1)

// test New Section

myIni.writeBool("New Section", "new bool", true)
myIni.writeString("New Section", "new str", "This is a book")
myIni.writeInt("New Section", "new int", 54321)

// test Bool

var b = myIni.readBool("", "item_true1", false)
assert(b)
myIni.writeBool("", "item_true1", b)
b = myIni.readBool("", "item_true2", false)
assert(b)
myIni.writeBool("", "item_true2", b)
b = myIni.readBool("", "item_true3", false)
assert(b)
myIni.writeBool("", "item_true3", b)
b = myIni.readBool("", "item_true4", false)
assert(b)
myIni.writeBool("", "item_true4", b)

b = myIni.readBool("", "item_false1", true)
assert(!b)
myIni.writeBool("", "item_false1", b)
b = myIni.readBool("", "item_false2", true)
assert(!b)
myIni.writeBool("", "item_false2", b)
b = myIni.readBool("", "item_false3", true)
assert(!b)
myIni.writeBool("", "item_false3", b)
b = myIni.readBool("", "item_false4", true)
assert(!b)
myIni.writeBool("", "item_false4", b)

try myIni.writeFile("/Users/heaven/Data/Swift/IniFile/IniFile/test2.ini")

// test Empty ini file

let myIni3 = try! CIniFile(fileName: "/Users/heaven/Data/Swift/IniFile/IniFile/test3.ini")

myIni3.writeBool("", "default_true", true)
myIni3.writeInt("first_sec", "sec1_int", 2020)
myIni3.writeString("first_sec", "sec1_str", "2020str")
myIni3.writeString("second_sec", "sec2_str", "第二區的字串文字")

try myIni3.writeFile()

