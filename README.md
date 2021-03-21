# Jupyter-Notebooks

I use Azure Data Studion and Anaconda for Jupyter-Notebooks.

## Offline Installation

Download and install [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15) and [Anaconda](https://docs.anaconda.com/anaconda/install/) or an other Python distribution.

Download and install Python Packages from phython Package Index:

- pip install --no-index .\ntlm-auth-1.5.0.tar.gz
- pip install --no-index .\requests_ntlm-1.1.0.rar.gz
- pip install --no-index .\pywinrm2-0.0.0.tar.gz
- pip install --no-index .\jupyter-1.0.0.tar.gz
- pip install --no-index .\powershell_kernel-0.1.4.tar.gz
- pip install --no-index .\pandas-1.2.3.tar.gz
- pip install --no-index .\pymongo-3.11.3.tar.gz

If you can use the online installation for python packages, remove --no-index from the command.

## Python Jupyter Notebooks

### Test-Netconnection.ipynb

class PyNet with the functions digtest and tping to test the name resolution and tcp connect to remote computers. These two functions are the same as a :bearded_person: wrote in the Powershell module [PsNetTools](https://github.com/tinuwalther/PsNetTools).

### Invoke-PSRemoting.ipynb

Invoke a powershell-scriptblock on remote computer.

### Invoke-WmiQuery.ipynb

Some example to invoke wmi-queries on windows computer.

### News-Reader.ipynb

This is my python-news-reader for [srf.ch](https://www.srf.ch/news/neuste-beitraege) and [suedostschweiz.ch](https://www.suedostschweiz.ch) :smile: 

## Powershell Jupyter Notebooks

### WIN-CheckRemoteServices.ipynb

With this notebook you can query remote Windows server for some services.
