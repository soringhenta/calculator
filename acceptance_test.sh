#!/bin/bash
count=1
while ! 2>/dev/null echo "" > /dev/tcp/localhost/8080
do
sleep 1
((count++ > 60)) && {
echo 'Eroare! Serviciul da timeout la pornire'
exit 1
}
done

#test $(curl localhost:8080/sum?a=1\&b=2) -eq 3
(($(curl -s 'http://localhost:8080/sum?a=1&b=2') == 3))

