import sys

class ProjectName():
    def __init__(self):
        pass

    def run(self):
        print("hello")
        return 0

if __name__ == __main__:
    projectName = ProjectName()
    errorCode = projectName.run()
    sys.exit(errorCode)
