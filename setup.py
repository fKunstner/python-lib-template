"""Setup file for MyLib."""
from setuptools import find_packages, setup

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    author="Author",
    name="MyLib",
    version="0.1.0",
    description="description",
    long_description="long description",
    long_description_content_type="text/markdown",
    install_requires=requirements,
    url="https://github.com/author/repo",
    license="MIT",
    packages=find_packages(),
    zip_safe=False,
    python_requires=">=3.5",
)
