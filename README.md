# Flutter 作品列表

**Flutter 作品列表** 是一個 Flutter 應用程式，會從 JSON API 抓取並顯示作品列表。此應用程式展示專案的詳細資訊，包括使用的程式語言、Git 儲存庫連結以及專案完成狀態。

## 功能

- 從遠端 JSON API 抓取作品資料。
- 在響應式且使用者友善的介面中顯示作品資訊。
- 每個專案卡片都包含作品名稱、語言、Git 地址以及進度。

## 安裝

要在本地端執行應用程式，請依照下列步驟操作：

### 前置需求

- 已在您的機器上安裝 [Flutter](https://flutter.dev/docs/get-started/install)。
- [Dart](https://dart.dev/get-dart)（隨 Flutter SDK 一同安裝）。

### 設定 (Linux)

1. **複製儲存庫：**

   ```sh
   git clone https://github.com/ChQiuHuang/Flutter-Projects
   cd Flutter-Projects
   ```

2. **安裝相依套件：**

   ```sh
   if cd flutter; then git pull && cd .. ; else git clone https://github.com/flutter/flutter.git; fi && ls && flutter/bin/flutter doctor && flutter/bin/flutter clean && flutter/bin/flutter config --enable-web
   ```

3. **執行應用程式：**

   ```sh
   flutter/bin/flutter build web --release
   ```

## 設定檔

該應用程式會從以下 URL 抓取專案資料：
<br>
`https://getpantry.cloud/apiv1/pantry/dd9b1690-a702-4a1f-908a-9fb8d77614aa/basket/patha`
<br>
如果您想使用不同的 API 端點，您可以在 `lib/main.dart` 檔案中修改此 URL。  
JSON 格式如下：  
JSON 資料的結構如下所示：

```json
{
  "Project Name": {
    "Language": "使用的程式語言",
    "Git Address": "專案 Git 儲存庫的 URL",
    "Progress": "進度"
  }
}
```

## 貢獻

歡迎貢獻！如果您發現任何問題或有建議，請開啟 issue 或提交 pull request。


## 感謝

- 感謝 [Flutter](https://flutter.dev) 建構跨平台應用程式。
