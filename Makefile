.PHONY: dev
dev:
	pip install -r requirements-dev.txt

.PHONY: release
release: clean
	python setup.py sdist bdist_wheel
	echo "Checking dist:"
	twine check dist/*
	# "Are you sure you want to publish the ^ release? Press any key to continue."
	read
	twine upload dist/*

.PHONY: clean
clean:
	rm -rf build dist .coverage .mypy_cache .pytest_cache __pycache__ ntgen.egg-info .tox acceptance/*actual.txt