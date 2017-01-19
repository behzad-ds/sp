local function history(extra, suc, result) 
  for i=1, #result do 
    delete_msg(result[i].id, ok_cb, false) 
  end 
  if tonumber(extra.con) == #result then 
    send_msg(extra.chatid, '"'..#result..'" پیام اخیر سوپر گروه حذف شد', ok_cb, false) 
  else 
    send_msg(extra.chatid, '💢the number of the desired msg was cleared', ok_cb, false) 
  end 
end 
local function run(msg, matches) 
  if matches[1] == 'rmsg' or 'حذف پیام' and is_owner(msg) then 
  if redis:get("id:"..msg.to.id..":"..msg.from.id) and not is_sudo(msg) then
return "شما میتوانید "..redis:ttl("id:"..msg.to.id..":"..msg.from.id).."⏱ ثانیه دیگر امتحان کنید\n ◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇"
end
redis:setex("id:"..msg.to.id..":"..msg.from.id, 60, true)
    if msg.to.type == 'channel' then 
      if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then 
        return "EROR" 
      end 
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]}) 
    else 
      return "only super groups\n ◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇◆◇" 
    end 
  else 
    return "only owner can use it" 
  end 
end 

return { 
    patterns = { 
        '^[!/#](rmsg) (%d*)$',
        '(حذف پیام) (%d*)$',        
    }, 
    run = run 
} 
