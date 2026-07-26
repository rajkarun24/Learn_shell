#Get rating from TMDB movie rating website.
#Fetching the data by using the curl command and sorting the percentage the movie is rated.
#Greater than 70, good.
#Less than 70, average.

input=$1
if [ -z "$input" ]; then
  echo Input movie name missing
  exit
fi

percent=$(curl -s https://www.themoviedb.org/movie/$input | grep data-percent | xargs -n1 | grep data-percent | awk -F = '{print $2}')

if [ "$percent" -ge 70]; then
  echo Good
else
  echo average
fi