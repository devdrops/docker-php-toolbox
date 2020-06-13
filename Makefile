#!/bin/bash

php:
	docker run -ti --rm -v $(pwd):/code -w /code devdrops/php-toolbox:latest php

composer:
	docker run -ti --rm -v $(pwd):/code -w /code devdrops/php-toolbox:latest composer

php_unit:
	docker run -ti --rm -v $(pwd):/code -w /code devdrops/php-toolbox:latest phpunit

php_cs:
	docker run -ti --rm -v $(pwd):/code -w /code devdrops/php-toolbox:latest phpcs

php_cs_fixer:
	docker run -ti --rm -v $(pwd):/code -w /code devdrops/php-toolbox:latest php-cs-fixer fix
