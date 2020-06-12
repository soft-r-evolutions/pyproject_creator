import pytest
from project_name import *

def test_projectName():
    projectName = ProjectName()
    assert projectName.run() == 0

def test_main():
    assert project_name.main() == 0
