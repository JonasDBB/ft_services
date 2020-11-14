cd /www
APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done

wp config create --dbname=wordpress --dbuser=mysql --dbpass=password --dbhost=mysql:3306
# wp db create
wp core install --title=wordpress --admin_user=jonas --admin_password=password --admin_email=jbennink@student.codam.nl --skip-email --url=192.168.99.105:5050
wp user create angi akramp@student.codam.nl --user_pass=lemao
wp user create ivy ivan-tol@student.codam.nl --user_pass=fluffy
wp user create ingmar ikole@student.codam.nl --user_pass=doggo

php-fpm7
nginx

while true; do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done