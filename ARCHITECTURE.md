# 專案架構規劃 (Project Architecture)

專為台灣小學三年級（8~9歲）兒童打造的卡通可愛風格英文口語互動家教網站：**Teacher Coco Owl English Adventure**

```







english teacher/
├── index.html                   # 瀏覽器即開即用整合版（支援直開與 Vite 進入點）
├── package.json                 # Vite + React + Tailwind 專案設定檔
├── vite.config.js               # Vite 設定
├── tailwind.config.js           # Tailwind 主題自訂（Duolingo卡通暖色調、立體圓角與陰影）
├── postcss.config.js            # PostCSS 設定
├── server.ps1                   # 免安裝 Node 的純本機 HTTP 預覽伺服器（PowerShell）
├── start_preview.bat            # 一鍵啟動預覽捷徑
├── src/
│   ├── main.jsx                 # Vite 應用程式進入點
│   ├── App.jsx                  # 主頁面互動容器
│   ├── index.css                # 繪本卡通動態、3D按鈕陰影、星光飄動樣式
│   ├── components/
│   │   ├── TeacherCoco.jsx      # 動態 SVG 戴眼鏡貓頭鷹老師（待機、傾聽、說話、思考）
│   │   ├── MicButton.jsx        # 超大立體兒童麥克風按鈕＋快速回答卡片＋打字備援
│   │   ├── ActionButtons.jsx    # 🐢慢速重聽、💡中文提示、👀字幕切換、🔔下課按鈕
│   │   ├── StarJar.jsx          # 右上角星星收集罐＋數字動畫
│   │   ├── SubtitleCard.jsx     # 大字體雙語字卡（英文發音強調、中文提示）
│   │   ├── ParentModal.jsx      # ⚙️ 家長設定（Gemini API Key、暱稱、程度、興趣）
│   │   └── ReportModal.jsx      # 🏆 今日成果獎狀 & 📊 家長專區每週學習週報
│   └── services/
│       ├── gemini.js            # Gemini 2.5 Flash API 整合與 System Prompt
│       ├── speech.js            # Web Speech API (STT辨識 & TTS 0.8/0.6語速發音)
│       ├── sound.js             # Web Audio API 合成輕快叮咚與獎勵音效
│       └── storage.js           # localStorage 儲存（學習歷程、週報、家長設定）
```
