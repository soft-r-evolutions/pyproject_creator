from project_name import ProjectName, main
import subprocess


def test_projectName():
    projectName = ProjectName()
    assert projectName.run() == 0


def test_main():
    assert main() == 0


def test_program():
    subprocess.call(["python", "project_name.py"])
