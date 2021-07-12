function test {
    domain="https://gibsonsanchez.duckdns.org"
    declare -a endpoints=("" "health" "register" "login")

    # random users and passwords
    username=$(date | md5sum)
    password=$(date | md5sum)

    for endpoint in "${endpoints[@]}"
    do
	url="${domain}/${endpoint}"
	
	if [[ ${endpoint} == "register" ]]
	then
	    curl -X POST -d "username=${username}&password=${password}" "${url}"
	elif [[ ${endpoint} == "login" ]]
	then
	    curl -X POST -d "username=${username}&password=${password}" "${url}"
	else
	    status=$(curl -s -o /dev/null -w "%{http_code}\n" "${url}")
	    echo "Status Code [${status}] for ${url}"
	fi
    done
}

test