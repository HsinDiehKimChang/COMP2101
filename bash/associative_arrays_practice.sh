
declare -A foo

foo=([A]="Apple" [B]="Ball" [C]="Cat")

foo[D]="Dog"

echo ${foo[@]}

echo ${!foo[@]}

foo[E]="Elephant"

echo ${foo[@]}

echo ${!foo[@]}

echo ${foo[A]}
