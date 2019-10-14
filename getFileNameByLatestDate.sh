let year=0
let month=0
let day=0
let file
while read -r filename; do
  dateString=$(echo "${filename}" | grep -Po '\d{6}')
  monthTmp=${dateString:0:2}
  dayTmp=${dateString:2:2}
  yearTmp=${dateString:4:2}
  if [[ $year < $yearTmp ]]; then
    year=$yearTmp
    month=$monthTmp
    day=$dayTmp
    file=$filename
  elif [[ $year == $yearTmp && $month < $monthTmp ]]; then
    year=$yearTmp
    month=$monthTmp
    day=$dayTmp
    file=$filename
  elif [[ $year == $yearTmp && $month == $monthTmp && $day < $dayTmp ]]; then
    year=$yearTmp
    month=$monthTmp
    day=$dayTmp
    file=$filename
  fi
done < <(grep -ircl --exclude="test.sh" $1 $2)
echo $file
