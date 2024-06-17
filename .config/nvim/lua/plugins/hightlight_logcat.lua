-- 定义高亮颜色（这里仅用于说明，Lua本身并不支持GUI颜色设置）  
local colors = {
    timestamp = "绿色",  -- 假设的颜色名称  
    priority = "红色",   -- 假设的颜色名称  
    message = "默认",    -- 假设的颜色名称  
}
-- 假设的logcat日志条目  
local logEntry = "2023-04-01 12:34:56.789 I/MyApp(12345): This is a log message"
-- 匹配时间戳和优先级的模式  
local timestampPattern = "(%d%d%d%d-%d%d-%d%d %d%d:%d%d:%d%d\\.%d+)"
local priorityPattern = "(%a+/%a+(%(%d+%)%)?)"
-- 使用string.match来提取时间戳和优先级  
local timestamp, priority = string.match(logEntry, timestampPattern .. " (%s*)" .. priorityPattern)
-- 打印高亮结果（这里仅打印文本和颜色名称，实际高亮取决于你的环境）  
if timestamp and priority then
    print(string.format("%s%s%s %s%s%s: %s",
        "\027[32m", timestamp, "\027[0m", -- 假设的ANSI转义码来表示绿色  
        "\027[31m", priority, "\027[0m",  -- 假设的ANSI转义码来表示红色  
        string.gsub(logEntry, timestampPattern .. " (%s*)" .. priorityPattern .. "(%.*$)", "")))
else
    print("未匹配到时间戳或优先级")
end
