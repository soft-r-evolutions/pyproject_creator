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
black s_utils
black tests
```

### Run the linter

Stop the build if Python syntax errors or undefined names

```
flake8 s_utils --count --select=E9,F63,F7,F82 --show-source --statistics
flake8 tests --count --select=E9,F63,F7,F82 --show-source --statistics
```

Treats all errors as warnings

```
flake8 s_utils --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
flake8 tests --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```

## Run the tests

```
pytest --cov=s_utils --cov-report=html --cov-report=term --log-cli-level=6 tests
xdg-open htmlcov/index.html
```
