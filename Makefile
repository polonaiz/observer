TAG='polonaiz/collectd'

build-collectd:
	docker build \
		--tag ${TAG} \
		./collectd

shell-collectd:
	docker run --rm -it \
		--net='host' \
		--name='collectd-shell' \
		--mount type=bind,source=$(shell pwd),destination=/opt/project,consistency=consistent \
		--mount type=bind,source=$(shell pwd)/collectd/etc/collectd,destination=/etc/collectd,consistency=consistent \
		${TAG} bash

start-collectd:
	docker run \
		--rm \
		--detach \
		--privileged \
		--net='host' \
		--name='collectd' \
		--mount type=bind,source=$(shell pwd)/collectd/etc/collectd,destination=/etc/collectd,consistency=consistent \
		${TAG}

stop-collectd:
	docker stop 'collectd'