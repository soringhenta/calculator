#!/bin/bash
count=1

while ! curl -s 'http://localhost:8080/sum?a=3&b=2' 2>/dev/null|grep -qE '^[0-9]+$'
do
sleep 1
((count++ > 60)) && {
echo 'Eroare! Serviciul da timeout la pornire'
exit 1
}
done

r=$(curl -s 'http://localhost:8080/sum?a=3&b=2' 2>/dev/null)

if (( ${r:-"a"} == 5 ))
then
  echo 'UAT test PASSED!!!'
  exit 0
else
  echo 'UAT test failed!!!'
  exit 1
fi
