initialise:
	pre-commit --version || brew install pre-commit
	pre-commit install
	pre-commit run --all-files
