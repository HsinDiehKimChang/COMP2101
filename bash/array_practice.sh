
colours=("red" "green" "blue" "purple" "lithgt yellow")  #do not need , between elements

echo ${#colours[@]}

colours+=("brown")

echo ${#colours[@]}


echo ${colours[@]}


for colour in ${colours[@]}
do
  echo "The colour is $colour"
done


# myarr=()
#
# myarr+=("red")
#
# #display the array
# echo $myarr
# #display first element in array
# echo ${myarr[0]}
# #display how many elements in array
# echo ${#myarr[@]}
#
# myarr+=("red")
# echo ${#myarr[@]}
#
# #get rid off array
# unset myarr   #directly to the variables, so do not need $ in front of variable
# echo $myarr
# echo ${#myarr[@]}
