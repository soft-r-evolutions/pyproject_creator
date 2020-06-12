import sys


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
