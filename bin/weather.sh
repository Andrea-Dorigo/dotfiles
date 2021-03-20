w=$(curl -s --request GET \
  --url https://freegeoip.app/json/ \
  --header 'accept: application/json' \
  --header 'content-type: application/json')
l=$(cut -d'"' -f24 <<<"$w")
f=${l//[' ']/'+'}
p=$(curl -s wttr.in/$f?format=%l:+%C+%t)
#echo curl -s wttr.in/Padova=%l:+%C+%t
echo ${p//['+']/' '}
