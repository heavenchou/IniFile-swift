# IniFile-swift
讀寫 INI File 的 Swift 版本

# INI 範例檔案
 
## inifile.ini

; 分號開頭是註解<br>
\# 這行是無法處理的資料，儲存時依然會保留<br>
; 底下這一組是最上層資料，section 指定為空字串即可處理

key=value

[Section]<br>
key1=value1<br>
key2=value2

[Section2]<br>
key3=value3

# CIniFile 使用方法 
預設 encoding 為 utf8

let myIni = try CIniFile(fileName = "inifile.ini", encoding = .utf8)

## 讀取資料
若 section 為空字串，表示讀取最上層無 section 的資料<br>
若讀取失敗，則傳回 defaultVal

let str = myIni.readString(section, key, defaultVal)<br>
let int = myIni.readInt(section, key, defaultVal)<br>
let bool = myIni.readBool(section, key, defaultVal)

## 設定資料

myIni.writeString(section, key, str)<br>
myIni.writeInt(section, key, int)<br>
myIni.writeBool(section, key, bool)

## 儲存至原來的檔案
儲存時會儘量依原始資料的順序與保存註解和無法處理的內容

myIni.writeFile()

## 儲存至指定檔案

myIni.writeFile("newinifile.ini")

## 注意：

布林值以下為真<br>
1, yes, on, true<br>
以下為假<br>
0, no, off, false<br>
其他則視為無法判斷。<br>
以上不區別大小寫，不過寫入時，請以這二個變數為主<br>
defaultBoolTrue, defaultBoolFalse<br>
但這只用在執行時有修改的布林值，不影響原始資料。<br>
也就是若原本是寫<br>
key=yes<br>
若 key 沒有修改，則不會變成 0 或 1 (依變數設定)，依然是 yes
