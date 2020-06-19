from distutils.core import setup
import setuptools


setup(
    name="[project_name]",
    version=(open("VERSION").read()).rstrip(),
    author="author",
    author_email="author_email",
    license="MIT",
    packages=setuptools.find_packages(),
    url="https://github.com/[ProjectSpace]/[project_name]",
    description="Project description",
    long_description_content_type="text/markdown",
    long_description=open("README.md").read(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    entry_points={
        'console_scripts': [
            '[project_name] = [project_name].app:main',
        ],
    },
)
