# Pytoolbelt nox test runner (Official)

This image is provided to test the tools you have built using pytoolbelt. It uses `nox` to facilitate building the required `ptvev` (pytoolbelt virtual environment) and `pytest` to facilitate running your tests. 

As `pytoolbelt` supports python starting at `3.9` The following versions of python are available, along with `pip` and the associated python development headers and `distutils`. 

Included python versions are
- Python 3.9
- Python 3.10
- Python 3.11
- Python 3.12

`nox` is installed in a virtual environment located at `/app/venv/` using `python 3.10`. The `python` and `nox` commands are then added to the $PATH variable. Which means in your projects docker-compose file, when you run `python` is will be referencing the python located at `/app/venv/bin/python`

## Docker Hub
https://hub.docker.com/r/pytoolbelt/nox-test-runner

## Official Pytoolbelt Github
https://github.com/pytoolbelt/pytoolbelt-cli

## Pytoolbelt CLI available on PyPi
https://pypi.org/project/pytoolbelt-cli/

## Deadsnakes PPA
This project installs multiple versions of python from the well known ubuntu `deadsnakes` ppa 
https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa

## Nox automated testing
https://nox.thea.codes/en/stable/
