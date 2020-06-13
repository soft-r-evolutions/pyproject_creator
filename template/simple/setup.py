from distutils.core import setup


setup(
    name="[project_name]",
    version=(open("VERSION").read()).rstrip(),
    author="author",
    author_email="author_email",
    url="https://github.com/[ProjectSpace]/[project_name]",
    description="Project description",
    long_description_content_type="text/markdown",
    long_description=open("README.md").read(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
