# [EndUserProjectName]

![Python%20package](https://github.com/[ProjectSpace]/[ProjectName]/workflows/Python%20package/badge.svg)

Insert project description here

## Installation

### Installing virtual-env

On ubuntu

```
sudo apt install vitualenv
```

### Create environment

```
virtualenv --python=python3 venv
```

## Activate environment

```
source venv/bin/activate
```

## Install locally

```
python -m pip install --upgrade pip
pip install -r requirements.txt
pip install flake8 black
pip install pytest pytest-cov
```

## Linter

### Help formatting the code with black

Run black to help to fix linter issues. Warning must be done is separate commits for QA.

```
black . --exclude venv
```

### Run the linter

Stop the build if Python syntax errors or undefined names

```
flake8 . --exclude venv --count --select=E9,F63,F7,F82 --show-source --statistics
```

Treats all errors as warnings

```
flake8 . --exclude venv --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```

## Run the tests

```
pytest --cov-config=.coveragerc --cov=. --cov-report=html --cov-report=term --log-cli-level=6 .
xdg-open htmlcov/index.html
```

## References

* [Python Application Layout](https://realpython.com/python-application-layouts/)
* [Semantic Versionning](https://semver.org/)

[Powered by PyProject Creator - MIT License](https://github.com/soft-r-evolutions/pyproject_creator)
