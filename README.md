# Make Sample

## Prerequisites

### CLang

https://github.com/llvm/llvm-project/releases/latest/

Most likely you need a file named **LLVM-{version}-win64.exe**

### Make

You can install **make** via **chocolatey** https://docs.chocolatey.org/en-us/choco/setup

* Open PowerShell as administrator
* Paste this command: 

    ```sh
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```

* Reload the path in PowerShell (https://stackoverflow.com/questions/17794507/reload-the-path-in-powershell)

    ```sh
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    ```

* Install **make**

    ```sh
    choco install make
    ```

> If **bash** is in the **Path** environment variable, **make** will execute makefile in **bash**

## Build and Run

```sh
make
```

```sh
bin/main.exe
```

## Clean

```sh
make clean
```
