-- really simple filter to get rid of the most general spam

local function has_value (tab, msg)
    for index, value in ipairs(tab) do
        if msg:find(value) then
            return true
        end
    end
    return false
end

local function myChatFilter(self, event, ...)
    local messageIntent = { "wts", "boost", "selling", "carrying", "carries", "carry" } -- we only want to filter when the intent to sell a boost is clear
    local keywords = {"mythic+0", "mythicplus", "boost", "torghast", "arena", "hc", "mc", "mythic", "keystone", "keystones", "mythic0", "mythic+"}

    local parsedMessage = select(1, ...):gsub("%s+", ""):lower()
    if has_value(messageIntent, parsedMessage) then
      if has_value(keywords, parsedMessage) then 
        return true
      end
    end
      return false
  end



ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", myChatFilter)
