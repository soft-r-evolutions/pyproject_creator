from project_name.app import main
import subprocess


def test_main():
    assert main() == 0


def test_program():
    subprocess.call(["python", "project_name/app.py"])
