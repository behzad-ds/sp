do

function run(msg, matches)
  return '\n '.. [[ 📄لیست راهنمای امکانات تفریحی🎉:
!praytime نام شهر
کاربرد: نشان دادن اوقات شرعی📌
!qr متن
تبدیل متن به کد📌
!emoji متن انگلیسی
تبدیل متن به استیکر اموجی📌
!news
دریافت اخبار 📌
!write متن انگلیسی
زیبا نویسی متن شما با صد فونت📌
!arz
دریافت نرخ ارز و سکه📌
!aparat متن شما
جست و جو در اپارات📌
📌!photo با رپلای روی استیکر
کاربرد:تبدیل استیکر به عکس
📌!sticker با رپلای روی عکس
کاربرد: تبدیل عکس به استیکر
!tr متن زبان
مترجم هوشمند. مثال:
!tr fa hello
نتیجه:
زبان : en-fa
معنی : سلام
امکانات بیشتر بزودی😶❤️
📊کانال ما:
@special_programing
💡خرید ربات ضد لینک:
@specialsupportbot
   ]]
end

return {
  description = "fun", 
  usage = "hack fun",
  patterns = {
    "^[!/#]helpfun"
  }, 
  run = run 
}

end
