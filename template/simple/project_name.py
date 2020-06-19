import sys


__version__ = "0.0.1"


class ProjectName:
    def __init__(self):
        pass

    def run(self):
        print("hello")
        return 0


def main():
    projectName = ProjectName()
    return projectName.run()


if __name__ == "__main__":
    errorCode = main()
    sys.exit(errorCode)
