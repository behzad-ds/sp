


do
local function is_ads(jtext)
if jtext:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or jtext:match("[Hh]ttps://telegram.me/") then
return true
end
return false
end
local function pre_process(msg)
    

    local hash = 'adslock:'..msg.to.id
    if redis:get(hash) and is_ads(msg.text) and not is_momod(msg)then
            delete_msg(msg.id, ok_cb, true)
            return "done"
        end
        return msg
    end

  


local function run(msg, matches)
    chat_id =  msg.to.id
    
    if is_momod(msg) and matches[1] == 'lock' then
      
            
                    local hash = 'adslock:'..msg.to.id
                    redis:set(hash, true)
                    return "ads has been locked"
  elseif is_momod(msg) and matches[1] == 'unlock' then
                    local hash = 'adslock:'..msg.to.id
                    redis:del(hash)
                    return "ads has been unlocked"
end

end

return {
    patterns = {
        '^[/!#](lock) (ads)$',
        '^[/!#](unlock) (ads)$'
    },
    run = run,
    pre_process = pre_process
}
end

