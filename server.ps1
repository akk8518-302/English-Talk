# PowerShell 輕量靜態 HTTP 本機預覽伺服器
# 無需安裝 Node.js 或 npm，支援所有現代瀏覽器與 Web Speech API

$port = 5173
$root = $PSScriptRoot
if (-not $root) { $root = Get-Location }

$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
$listener.Start()

Write-Host "==========================================================" -ForegroundColor Green
Write-Host "  🦉 Teacher Coco 貓頭鷹英文冒險教室本機預覽伺服器已啟動！" -ForegroundColor Cyan
Write-Host "  網址: http://localhost:$port" -ForegroundColor Yellow
Write-Host "  提示: Web Speech API 需要 http://localhost 才能運作語音辨識與朗讀" -ForegroundColor White
Write-Host "  按 Ctrl+C 可關閉伺服器" -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Green

# 自動在預設瀏覽器開啟網址
Start-Process "http://localhost:$port"

try {
    while ($true) {
        $client = $listener.AcceptTcpClient()
        [System.Threading.ThreadPool]::QueueUserWorkItem({
            param($c)
            try {
                $stream = $c.GetStream()
                $reader = [System.IO.StreamReader]::new($stream)
                $requestLine = $reader.ReadLine()
                if (-not $requestLine) { $c.Close(); return }

                $tokens = $requestLine.Split(" ")
                $path = $tokens[1]
                if ($path -eq "/" -or $path -eq "") { $path = "/index.html" }
                
                # 移除 query string
                if ($path.Contains("?")) {
                    $path = $path.Substring(0, $path.IndexOf("?"))
                }

                $localPath = [System.IO.Path]::Combine($root, $path.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar))

                if (-not [System.IO.File]::Exists($localPath)) {
                    $localPath = [System.IO.Path]::Combine($root, "index.html")
                }

                $content = [System.IO.File]::ReadAllBytes($localPath)
                $ext = [System.IO.Path]::GetExtension($localPath).ToLower()

                $contentType = "text/html; charset=utf-8"
                if ($ext -eq ".js" -or $ext -eq ".jsx") { $contentType = "application/javascript; charset=utf-8" }
                elseif ($ext -eq ".css") { $contentType = "text/css; charset=utf-8" }
                elseif ($ext -eq ".json") { $contentType = "application/json; charset=utf-8" }
                elseif ($ext -eq ".png") { $contentType = "image/png" }
                elseif ($ext -eq ".svg") { $contentType = "image/svg+xml" }

                $header = "HTTP/1.1 200 OK`r`nContent-Type: $contentType`r`nContent-Length: $($content.Length)`r`nAccess-Control-Allow-Origin: *`r`nConnection: close`r`n`r`n"
                $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)

                $stream.Write($headerBytes, 0, $headerBytes.Length)
                $stream.Write($content, 0, $content.Length)
                $stream.Flush()
                $c.Close()
            } catch {
                try { $c.Close() } catch {}
            }
        }, $client) | Out-Null
    }
} finally {
    $listener.Stop()
}
